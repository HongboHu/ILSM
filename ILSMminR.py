
import os  # for file reading and writting
import clingo
#调用自定义的class和function等
from task_class import TaskClass
import time
import random
import openpyxl
import multiprocessing

# 定义一个回调函数，用于处理每个找到的模型
# def on_model(model):
#     print(f"Model found: {model}")

def string_to_set(input_string):
    elements = input_string.split()
    result_set = {element for element in elements}
    return result_set

def get_all_answer_sets(ctl):
    answer_sets = []
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            answer_sets.append(string_to_set(f"{model}"))
    return answer_sets

def get_last_answer_set(ctl):
    last_SM = set()
    opt_num = None
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            last_SM = string_to_set(f"{model}")
            opt_num = model.cost
    return last_SM, opt_num


def convert_as_constraints(A):
    constraints = []  
    for item in A:
        constraint = ":- " + ", ".join(item) + "."
        constraints.append(constraint)
    B = "\n".join(constraints)
    return B


def convert_as_ASPfacts(A):
    part1 = set()  
    part2 = set()  
    for item in A:
        if item.startswith('expNegMatch'):
            y = item.split(',')[-1].rstrip(')')
            if y == 't':
                part2.add(item.split(',')[0].removeprefix('expNegMatch('))
        else:
            part1.add(item)
    result = []
    for item in part1:
        if item.startswith('expNeg') and (item.split('(')[1].rstrip(')') in part2):
            result.append(item)
        elif item.startswith('input') and (item.split(',')[0].removeprefix('input(') in part2):  
            result.append(item)
        elif not (item.startswith('expNegMatch') or item.startswith('expNeg') or item.startswith('input')):
            result.append(item)
    B = ". ".join(result) + "."
    return B


def list_difference(A, B):
    return [item for item in A if item not in B]


def innerloop(program_file, n_value = 0):
    program_violating = """
        #external enable_violating.
        :- not violating, enable_violating. %可以通过加原子用external实现
        ex(neg) :- enable_violating.
    """

    try:
        print("1>get the violating_solns at the first solving round.")
        ctl = clingo.Control(["--models=0"])
        ctl.load(program_file)
        ctl.add("base", [], program_violating)
        ctl.add("base", [], f"#const n={n_value}.")
        ctl.ground([("base", [])])
        ctl.assign_external(clingo.Function("enable_violating"), True)
        ctl.solve()
        violating_solns = get_all_answer_sets(ctl)
        print(violating_solns)

        print("2>get the positive_solns at the second solving round.")
        ctl.add("base", [], convert_as_constraints(violating_solns))
        ctl.assign_external(clingo.Function("enable_violating"), False)
        ctl.solve()
        positive_solns = get_all_answer_sets(ctl)
        print(positive_solns)

        print("3>get the solutions.")
        solutions_as = list_difference(positive_solns, violating_solns)
        if solutions_as:
            return solutions_as[0]
        else:
            return ''

    except RuntimeError as e:
        print(f"RuntimeError: {e}")
    except ValueError  as e:
        print(f"LogicError: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")


def outerloop(program_file, k_value = 0):
    for i in range(k_value):  # 从 0 到 4
        print(f"=========== Check {i} rules ===========")
        solution = innerloop(program_file, i)
        if solution != '':
            print(f"{solution} is a Answer Set w.r.t. a solution.")
            return
    print(f"==========No solution whose number of rules is less then {k_value}.========")


def startILSM(facts_file, encoding_file):
    try:
        ctl = clingo.Control(["--models=0"])
        ctl.load(facts_file)
        ctl.load(encoding_file)
        ctl.ground([("base", [])])
        minimal_as = get_last_answer_set(ctl)
        return minimal_as

    except RuntimeError as e:
        print(f"RuntimeError: {e}")
    except ValueError  as e:
        print(f"LogicError: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

def callILSM(facts_file, encoding_file, currentLen, type_str):
    try:
        ctl = clingo.Control()
        ctl.load(facts_file)
        ctl.load(encoding_file)
        ctl.add("base", [], f"#const n={currentLen}.")
        if type_str == 'hard':
            ctl.add("base", [], ":- expNeg(I), expNegMatch(I, t).")
        ctl.ground([("base", [])])
        all_as = get_all_answer_sets(ctl)
        if len(all_as) == 0:
            return None
        else:
            return all_as

    except RuntimeError as e:
        print(f"RuntimeError: {e}")
    except ValueError  as e:
        print(f"LogicError: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

def callcheckSM(facts_str):
    root_dir = os.getcwd()
    checkSM_dir = root_dir + '/checkSM.lp'
    try:
        ctl = clingo.Control()
        ctl.load(checkSM_dir)
        ctl.add("base", [], facts_str)
        ctl.ground([("base", [])])
        result = ctl.solve()
        if result.satisfiable:
            return False 
        else:
            return True 

    except RuntimeError as e:
        print(f"RuntimeError: {e}")
    except ValueError  as e:
        print(f"LogicError: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

def continueILSM(facts_file, encoding_file, currentLen):
    hardResult = callILSM(facts_file, encoding_file, currentLen,'hard')
    if hardResult != None:
        return hardResult[0]
    softResult = callILSM(facts_file, encoding_file, currentLen, 'soft')
    if softResult != None:
        for result in softResult:
            strASPfacts = convert_as_ASPfacts(result)
            if callcheckSM(strASPfacts):
                return result
            else:
                continue
        return None


def ILSMminRfunction(task_file,task):
    root_dir = os.getcwd()
    mate_dir = root_dir + '/task_data_logic/ILSM%s.lp' %  task_file
    ILSMmin_dir = root_dir + '/ILSMmin.lp'
    ILSM_dir = root_dir + '/ILSM.lp'
    sols_dir = root_dir + '/solutions/ILSM/%s.lp' %  task_file
    recordFile = root_dir + '/solutions/record_comparison.xlsx'
    hypothesisAS = None
    result = 'fail'
    task.writeTaskILSM(mate_dir)
    end_preprocess_time = time.time()
    checkResult = task.checkSolILSM()
    if not checkResult[0]:
        print('fail')
        result = result + checkResult[1]
    else:
        firstTry = startILSM(mate_dir, ILSMmin_dir)
        hypothesisAS = firstTry[0]
        matchedNo = firstTry[1][0]
        startLen = firstTry[1][1]
        if matchedNo != 0:
            for n in range(startLen, task.upperBound + 1):
                print(f"来来来，继续求解{n}条规则")
                hypothesisAS = continueILSM(mate_dir, ILSM_dir, n)
                if hypothesisAS == None:
                    continue
                else:
                    break
    end_process_time = time.time()
    process_time = end_process_time - end_preprocess_time
    process_time = float("{:.5f}".format(process_time))
    # 后处理
    if hypothesisAS == None: 
        task.record_to_excel(recordFile, 'ILSMminR', task_file, result, process_time, '-', '-')
        return
    print(f"已经找到解{hypothesisAS}，解析成rule形式并写入文件。")
    result = 'success'
    cardinality = sum(1 for rule in hypothesisAS if rule.startswith('lastRule('))
    length = task.modelParseWrite(hypothesisAS, sols_dir)
    task.record_to_excel(recordFile, 'ILSMminR', task_file, result, process_time, cardinality, length)


def test(task_file):
    task_dir = root_dir + '/task_data_source/%s.txt' % task_file
    mate_dir = root_dir + '/task_data_logic/ILSM%s.lp' % task_file
    ILSM_dir = root_dir + '/ILSM.lp'
    tRead = TaskClass()
    tRead.readTaskFromFile(task_dir)
    continueILSM(mate_dir, ILSM_dir, 1)


if __name__ == "__main__":
    root_dir = os.getcwd()
    #test('taskTest')
    recordFile = root_dir + '/solutions/record.xlsx'
    #ILSMminRfunction('taskTest2')
    taskList = ['taskTest', 'taskTestc4', 'taskTest1']
    for tfile in taskList:
        task_dir = root_dir + '/task_data_source/%s.txt' % tfile
        tRead = TaskClass()
        tRead.readTaskFromFile(task_dir)
        #ILSMminRfunction(tfile)
        process = multiprocessing.Process(target=ILSMminRfunction, kwargs={"task_file": tfile, "task": tRead})
        process.start()
        timeout = 1
        process.join(timeout=timeout)

        if process.is_alive():
            print("超时！")
            tRead.record_to_excel(recordFile, 'ILSMminR', tfile, 'fail', '-', '-', '-', '-')
            process.terminate()
            process.join()  
