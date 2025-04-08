
import os  # for file reading and writting
import clingo
#调用自定义的class和function等
from task_class import TaskClass
import time
import random
import openpyxl
import multiprocessing
import ILASPminR
import ILSMminR
import ILASPminL


def processBounded(tfile, tRead, timeout_seconds, str_type):
    if str_type == 'ILSMminR':
        process = multiprocessing.Process(target=ILSMminR.ILSMminRfunction, kwargs={"task_file": tfile, "task": tRead})
    elif str_type == 'ILASPminR':
        process = multiprocessing.Process(target=ILASPminR.ILASPminRfunction, kwargs={"task_file": tfile, "task": tRead})
    process.start()
    process.join(timeout=timeout_seconds)

    if process.is_alive():
        print("超时！")
        tRead.record_to_excel(recordFile, str_type, tfile, 'fail(time)', '-', '-', '-')
        process.terminate()
        # print("已结束！")
        process.join()  
    elif not process.is_alive():
        if process.exitcode == -9:  # SIGKILL
            print("超内存！")
            tRead.record_to_excel(recordFile, str_type, tfile, 'fail(mem)', '-', '-', '-')
            process.terminate()
            # print("已结束！")
            process.join()  
        elif process.exitcode != 0:
            print(f"进程被异常终止，相应code {process.exitcode}")





if __name__ == "__main__":
    root_dir = os.getcwd()
    recordFile = root_dir + '/solutions/record_comparison.xlsx'
    taskList = ['tcrNet_30_1_15_1']  
    nameGRN = 'tcrNet'
    
    backgroundLenCandidates = [0, 6, 12, 18, 24]  #[0, 6, 12, 18, 24]
    posExampleIdCandidates = [1, 2, 3, 4] #[1, 2, 3, 4]
    negExampleLenCandidates = [0, 1, 2, 3, 4] #[0, 1, 2, 3, 4]

    taskListSeq = []
    #for backgroundLen in backgroundLenCandidates: #[12, 18, 24]:
        #for idx in posExampleIdCandidates:  #[1,2]:
            #for negExampleLen in negExampleLenCandidates:
                #taskListSeq.append(f"{nameGRN}_{backgroundLen}_{idx}_{negExampleLen}")
    #print(taskListSeq)
    #for idx in range(1,101): #[12, 18, 24]:
        #taskListSeq.append(f"{nameGRN}{idx}")
    #print(taskListSeq)


    timeoutLimit = 60 * 60 * 3 
    for tfile in taskList:
        task_dir = root_dir + '/GRN_source/%s.txt' % tfile

        tRead = TaskClass()
        tRead.readTaskFromFile(task_dir)

        processBounded(tfile, tRead, timeoutLimit, 'ILSMminR')
        ILASPminL.ILASPminLfunction(tfile, tRead, timeoutLimit)


