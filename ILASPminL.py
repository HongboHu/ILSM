import os  # for file reading and writting
import clingo
#调用自定义的class和function等
from task_class import TaskClass
import subprocess
import shlex
import time
import signal
from typing import Tuple, Optional, Dict
import psutil  # 用于递归终止子进程


def terminate_process_and_children(parent_pid):
    """递归终止进程及其子进程"""
    try:
        parent = psutil.Process(parent_pid)
        children = parent.children(recursive=True)  
        for child in children:
            child.terminate() 
        _, alive = psutil.wait_procs(children, timeout=3)  
        for child in alive:
            child.kill()  
        parent.terminate()  
        parent.wait(timeout=3)  
    except psutil.NoSuchProcess:
        pass  

def run_command_with_oom_detection(
        command: str,
        timeout: float,
        shell: bool = False,
        cwd: Optional[str] = None,
        env: Optional[dict] = None
) -> Tuple[int, str, str, Dict]:
    """
    执行命令并检测是否被系统OOM Killer终止

    参数:
        command: 要执行的命令字符串
        timeout: 超时时间(秒)
        shell: 是否使用shell执行
        cwd: 工作目录
        env: 环境变量

    返回:
        (returncode, stdout, stderr, analysis)
        returncode: 进程返回码
        stdout: 标准输出内容
        stderr: 标准错误内容
        analysis: 包含详细分析的字典:
            {
                'timed_out': bool,      # 是否超时
                'oom_killed': bool,     # 是否被OOM Killer终止
                'execution_time': float,# 执行时间(秒)
                'signal': Optional[int] # 接收到的信号
            }
    """
    if not shell:
        command = shlex.split(command)

    analysis = {
        'timed_out': False,
        'oom_killed': False,
        'execution_time': 0.0,
        'signal': None
    }

    start_time = time.time()

    process = subprocess.Popen(
        command,
        shell=shell,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    try:
        stdout, stderr = process.communicate(timeout=timeout)
        returncode = process.returncode
    except subprocess.TimeoutExpired:
        terminate_process_and_children(process.pid)
        analysis['timed_out'] = True
        returncode = -9
        stdout, stderr = "", "超出python所设时间上线"

    analysis['execution_time'] = time.time() - start_time

    if returncode < 0:
        analysis['signal'] = -returncode
    if returncode == 137 and not analysis['timed_out']:
        analysis['oom_killed'] = True

    # 打印摘要信息
    print(f"\n命令执行结果摘要:")
    print(f"命令: {command}")
    print(f"执行时间: {analysis['execution_time']:.2f}秒")
    print(f"超时: {'是' if analysis['timed_out'] else '否'}")
    print(f"被OOM Killer终止: {'是' if analysis['oom_killed'] else '否'}")
    if analysis.get('signal'):
        print(f"终止信号: {analysis['signal']} ({signal.Signals(analysis['signal']).name})")
    print(f"返回码: {returncode}")
    print(f"标准输出长度: {len(stdout)} 字符")
    print(f"标准错误长度: {len(stderr)} 字符")

    return returncode, stdout, stderr, analysis

def invokeILASP(task_name,timeout_seconds = 10):
    test_command = 'ILASP --version=4 -nc -ml=1000 --max-rule-length=1000 -q %s' % task_name  


    print(f"执行命令: {test_command}")

    returncode, stdout, stderr, analysis = run_command_with_oom_detection(
        test_command,
        timeout=timeout_seconds,
        shell=True
    )

   
    if analysis['oom_killed']:
        print("\n检测到进程被系统OOM Killer终止")
        print("具体原因: 系统内存不足")
    elif analysis['timed_out']:
        print("\n警告: 命令执行超时并被终止")
    elif returncode != 0:
        print("\n警告: 命令执行失败")
        print(f"错误输出:\n{stderr}")
    else:
        print("\n命令执行成功")
        print(f"输出:\n{stdout}")
        if len(stderr.strip()) > 0: 
            print(f"内部错误长度:\n{len(stderr)}")
            print(f"内部错误输出:\n{stderr}")
    return analysis['oom_killed'],analysis['timed_out'],returncode,analysis['execution_time'],stdout,stderr



def ILASPminLfunction(task_file,task,timeoutLimit = 10):
    root_dir = os.getcwd()
    mate_dir = root_dir + '/task_data_logic/ILASPmeta_%s.las' %  task_file
    sols_dir = root_dir + '/solutions/ILASP/%s.las' %  task_file
    recordFile = root_dir + '/solutions/record_comparison.xlsx'
    result = 'success'
    task.writeILASPMeteTask(mate_dir)
    invokeResult = invokeILASP(mate_dir, timeoutLimit)
    if invokeResult[0]: 
        result = 'fail(mem)'
        task.record_to_excel(recordFile, 'ILASPminL', task_file, result, float("{:.2f}".format(invokeResult[3])), '-', '-')
    elif invokeResult[1]: 
        result = 'fail(time)'
    elif invokeResult[2] != 0: 
        result = f"fail({invokeResult[2]})"
    else: 
        if len(invokeResult[5]) == 0:  
            if invokeResult[4].count('UNSATISFIABLE') > 0:
                result = 'fail(unsat)'
                task.record_to_excel(recordFile, 'ILASPminL', task_file, result, float("{:.5f}".format(invokeResult[3])), '-', '-') 
            else: 
                cardinality, length = task.modelParseWriteILASP(invokeResult[4], sols_dir)
                task.record_to_excel(recordFile, 'ILASPminL', task_file, result, float("{:.5f}".format(invokeResult[3])), cardinality, length)   
        else: 
            result = f"fail({invokeResult[5][:5]}...)"
    #
    if result.startswith('fail') and result != 'fail(unsat)' and result != 'fail(mem)':
        task.record_to_excel(recordFile, 'ILASPminL', task_file, result, '-', '-', '-')


if __name__ == "__main__":
    root_dir = os.getcwd()
    recordFile = root_dir + '/solutions/record_comparison.xlsx'
    # 
    taskList = ['arabidopsis_0_2_0']  

    nameGRN = 'arabidopsis'
    backgroundLenCandidates = [0]  
    posExampleIdCandidates = [1, 2, 3, 4]
    negExampleLenCandidates = [1] 

    taskListSeq = []
    for backgroundLen in backgroundLenCandidates:  # [12, 18, 24]:
        for idx in posExampleIdCandidates:  # [1,2]:
            for negExampleLen in negExampleLenCandidates:
                taskListSeq.append(f"{nameGRN}_{backgroundLen}_{idx}_{negExampleLen}")
    #print(taskListSeq)

    timeoutLimit = 6  
    for tfile in taskListSeq: #taskList
        task_dir = root_dir + '/GRN_source/%s.txt' % tfile

        tRead = TaskClass()
        tRead.readTaskFromFile(task_dir)
        # print(len(tRead.universe))
        ILASPminLfunction(tfile, tRead, timeoutLimit)

