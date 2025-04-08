
import numpy as np
import os  # for file reading and writting
from itertools import combinations
import sys, getopt  # for argv argument
import random
import copy
import openpyxl

def read_between_markers(file_path, start_marker, end_marker):
    with open(file_path, 'r') as file:
        content = []
        inside_target_area = False

        for line in file:
            line = line.strip()

            if line == start_marker:
                inside_target_area = True
                continue  

            if line == end_marker:
                inside_target_area = False
                break  

            if inside_target_area:
                content.append(line)
        return content





class Rule:
    def __init__(self):
        self.head = ''
        self.pos = set()
        self.neg = set()

    def refreshRuleFromAttributes(self, head_str, pos_set, neg_set):
        self.head = head_str
        self.pos = pos_set
        self.neg = neg_set

    def readRuleFromLine(self, rule_str,split_str):
        self.pos = set()  
        self.neg = set()
        h_and_b = rule_str.split('.')[0].split(':-')
        self.head = h_and_b[0].strip()
        if len(h_and_b) > 1 and h_and_b[1].count(split_str) > 0:  
            list_body = h_and_b[1].split(split_str)
        elif len(h_and_b) > 1 and len(h_and_b[1].strip()) > 0:  
            list_body = [h_and_b[1]]
        else:  
            list_body = []
        for str_atom in list_body:
            str_atom = str_atom.strip()
            if str_atom.startswith('not'):  
                self.neg.add(str_atom[3:].strip())
            else:
                self.pos.add(str_atom.strip())


    def toStr(self):
        pos_body = ','.join(self.pos)
        neg_body = ','.join(list(map(lambda x: 'not %s' % x, self.neg)))
        if pos_body != '' and neg_body != '':
            pos_body = pos_body + ','
        str_tmp = '%s :- %s%s.' % (self.head, pos_body, neg_body)
        return str_tmp

    def printR(self):
        print(self.toStr())

    def constructMetaR(self):
        pos_body = ','.join(list(map(lambda x: 'e(%s, X)' % x, self.pos)))
        if pos_body != '':
            pos_body = pos_body + ','
        neg_body = ','.join(list(map(lambda x: 'not e(%s, X)' % x, self.neg)))
        if neg_body != '':
            neg_body = neg_body + ','
        str_tmp = 'e(%s, X) :- %s%s ex(X).' % (self.head, pos_body, neg_body)
        return str_tmp

    def constructRILSM(self, index):
        str_tmp = ''
        str_tmp = str_tmp + 'bgHead(b%d,%s). ' % (index, self.head)
        str_tmp = str_tmp + ' '.join(list(map(lambda x: 'bgBodyPos(b%d,%s). ' % (index, x), self.pos)))
        str_tmp = str_tmp + ' '.join(list(map(lambda x: 'bgBodyNeg(b%d,%s). ' % (index, x), self.neg)))
        return str_tmp

    def constructMetaSm(self,idx):
        rule_str = self.constructMetaR().rstrip('.') + ', active(%d). \n' % (idx)
        active_str = '{active(%d)}.\n' % (idx)
        each_str = active_str + rule_str
        return each_str




    def satisfy_body(self, interp):#removable
        for m in self.pos:
            if not (m in interp):
                return False
        for m in self.neg:
            if m in interp:
                return False
        return True

    def satisfied(self, interp):
        if self.satisfy_body(interp) and not (self.head in interp):
            return False
        return True


    def collectAtomsR(self):
        all_elements = set()
        all_elements.add(self.head)
        all_elements.update(self.pos)
        all_elements.update(self.neg)
        return all_elements



class Example:
    def __init__(self):
        self.interpretations = []

    def assignExampleFromList(self, lst):
        self.interpretations = lst

    def appInterpretation(self, inter):
        self.interpretations.append(inter)

    def printE(self):
        for e in self.interpretations:
            print(e)

    def collectAtomsE(self):
        all_elements = set()
        for i in self.interpretations:
            all_elements.update(i)
        return all_elements

    def str_convert_inter(self,str_inter):
        content = str_inter.strip('{ }')
        elements = list()
        if len(content) > 0:
            elements = [element.strip() for element in content.split(',')]
        return set(elements)


    def readExampleFromFile(self, nlp_file, type):
        lines = read_between_markers(nlp_file, '#%s starts' % (type), '#%s ends' % (type))
        self.interpretations = []
        for line in lines:
            self.appInterpretation(self.str_convert_inter(line))



class NLP:
    def __init__(self):
        self.rules = []

    def readProgramFromFile(self, nlp_file):
        self.rules = [] 
        fp = open(nlp_file)
        line = fp.readline()
        while (line != ''):
            line.strip()  
            if line.startswith('#'):   
                line = fp.readline()
                continue
            if line == '':  
                line = fp.readline()
                continue
            rule = Rule()
            rule.readRuleFromLine(line,',')
            self.rules.append(rule)
            line = fp.readline()
        fp.close()

    def readBackgroundFromFile(self, nlp_file):
        lines = read_between_markers(nlp_file, '#B starts', '#B ends')
        self.rules = []
        for line in lines:
            rule = Rule()
            rule.readRuleFromLine(line,',')
            self.rules.append(rule)
        #print("OK")


    def assignProgramFromList(self, lst):
        self.rules = lst

    def appProgram(self, rul):
        self.rules.append(rul)

    def printP(self):
        for r in self.rules:
            r.printR()

    def collectAtomsP(self):
        all_elements = set()
        for r in self.rules:
            all_elements.update(r.collectAtomsR())
        return all_elements

    def writeB(self, filePath):
        str_all_rules = '%meta(B)\n'
        for r in self.rules:
            str_all_rules = str_all_rules + r.constructMetaR() + '\n'
        with open(filePath, 'w') as file_e: 
            file_e.write(str_all_rules)
        return str_all_rules

    def writedown(self, filePath):
        str_all_rules = ''
        for r in self.rules:
            str_all_rules = str_all_rules + r.toStr() + '\n'
        with open(filePath, 'w') as file_e: 
            file_e.write(str_all_rules)

    def writedownILASP(self, filePath):
        str_all_rules = ''
        for r in self.rules:
            if len(r.pos) == 0 and len(r.neg) == 0:
                str_all_rules = str_all_rules + f"{r.head}.\n"
            else:
                str_all_rules = str_all_rules + r.toStr() + '\n'
        with open(filePath, 'w') as file_e: 
            file_e.write(str_all_rules)

    def countLength(self):
        length = 0
        for r in self.rules:
            length = length + len(r.pos) + len(r.neg) + 1 
        return length

    def reductLFP(self, inter):
        def immediate_consequence_operator(program, interpretation):
            new_inter = interpretation.copy()
            for rule in program:
                if rule.pos.issubset(interpretation):
                    new_inter.add(rule.head)
            return new_inter
        reductedRules = []
        for rule in self.rules:
            if rule.neg.isdisjoint(inter):
                newRule = Rule()
                newRule.refreshRuleFromAttributes(rule.head, rule.pos, set())
                reductedRules.append(newRule)
        knowledge = set()  
        while True:
            new_knowledge = immediate_consequence_operator(reductedRules, knowledge)
            if new_knowledge == knowledge:  
                break
            knowledge = new_knowledge
        return knowledge

    def refreshRuleFromAttributes(self, head_str, pos_set, neg_set):
        self.head = head_str
        self.pos = pos_set
        self.neg = neg_set



class TaskClass:
    def __init__(self):
        self.background = NLP()
        self.positiveE = Example()
        self.negativeE = Example()
        self.universe = set()
        self.upperBound = 0

    def computeA(self):
        atoms = set()
        atoms.update(self.background.collectAtomsP())
        atoms.update(self.positiveE.collectAtomsE())
        atoms.update(self.negativeE.collectAtomsE())
        self.universe = atoms

    def assignTask(self,prog,pos,neg):
        self.background = prog
        self.positiveE = pos
        self.negativeE = neg
        self.computeA()

    def readTaskFromFile(self, nlp_file):
        background = NLP()
        background.readBackgroundFromFile(nlp_file)
        #background.printP()
        posE = Example()
        posE.readExampleFromFile(nlp_file,'E+')
        #posE.printE()
        negE = Example()
        negE.readExampleFromFile(nlp_file,'E-')
        #negE.printE()
        self.assignTask(background, posE, negE)


    def writeUandBILSM(self, filePath):
        elements = ";".join(self.universe)
        str_all_rules = f"universe({elements}).\n"
        i = 0  
        for r in self.background.rules:
            i = i + 1
            str_all_rules = str_all_rules + r.constructRILSM(i) + '\n'
        with open(filePath, 'w') as file_e:  
            file_e.write(str_all_rules)
        return str_all_rules


    def writeExamplesILSM(self, filePath):
        str_examples = ''
        i = 0  
        for exp in self.positiveE.interpretations:
            i = i + 1
            str_examples = str_examples + 'expPos(p%d).' % (i)
            if len(exp) > 0:
                str_examples = str_examples + ' '.join(list(map(lambda x: 'input(p%d,%s). ' % (i, x), exp))) + '\n'
        i = 0
        for exp in self.negativeE.interpretations:
            i = i + 1
            str_examples = str_examples + 'expNeg(n%d).' % (i)
            if len(exp) > 0:
                str_examples = str_examples + ' '.join(list(map(lambda x: 'input(n%d,%s). ' % (i, x), exp))) + '\n'
        with open(filePath, 'a') as file_e:
            file_e.write(str_examples)
        return str_examples



    def writeMetaSm(self, filePath):
        with open(filePath, "a") as file:
            A = self.universe
            rule_tmp = Rule()
            str_tmp = '%meta(Sm) \n'
            i = 0 
            for a in A:
                for r1 in range(len(A) + 1):
                    for B in combinations(A, r1):
                        B = set(B)
                        for r2 in range(len(A) + 1):
                            for C in combinations(A, r2):
                                C = set(C)
                                if B.isdisjoint(C): 
                                    rule_tmp.refreshRuleFromAttributes(a, B, C)
                                    i = i + 1
                                    str_tmp = str_tmp + rule_tmp.constructMetaSm(i)
                                    if i % 100 == 0: 
                                        file.write(f"%for the {i}-th rule")
                                        file.write(str_tmp)
                                        str_tmp = ''
            self.upperBound = i
            if str_tmp != '':
                file.write(str_tmp)


    def writeMetaB(self, filePath):
        self.background.writeB(filePath)

    def constructMetaE(self,indStr,inter):
        pos_body = ','.join(list(map(lambda x: 'e(%s, %s)' % (x, indStr), inter)))
        neg_body = ','.join(list(map(lambda x: 'not e(%s, %s)' % (x, indStr), self.universe.difference(inter) )))
        if pos_body != '' and neg_body != '':
            pos_body = pos_body + ','
        str_tmp = '%s%s' % (pos_body, neg_body)
        return str_tmp


    def writeMetaEpos(self, filePath):
        str_all_rules = '%meta(E+)\n'
        for index, value in enumerate(self.positiveE.interpretations):
            str_body = self.constructMetaE(index, value)
            str1 = 'ex(%d).\n' % (index) #ex(1).
            str2 = ':- not covered(%d).\n' % (index)  #:- not covered(1).
            str3 = 'covered(%d) :- %s.\n' % (index, str_body) #covered(1) :- e(p, 1).
            str_all_rules = str_all_rules + str1 + str2 + str3
        # str_all_rules.rstrip('\n')
        with open(filePath, 'a') as file_e:
            file_e.write(str_all_rules)
        return str_all_rules

    def writeMetaEneg(self, filePath):
        str_all_rules = '%meta(E-)\n'
        for index, value in enumerate(self.negativeE.interpretations):
            str_body = self.constructMetaE('neg', value)
            str_all_rules = str_all_rules + 'violating :- %s.\n' % (str_body)
        with open(filePath, 'a') as file_e:
            file_e.write(str_all_rules)
        return str_all_rules

    def writeMetaAux(self, filePath):
        str_all_rules = '%meta(Aux, n) \n:- #count{ R : active(R)} != n.\n#show active/1. \n'
        with open(filePath, 'a') as file_e:
            file_e.write(str_all_rules)
        return str_all_rules

    def writeMeteTask(self, filePath):
        self.writeMetaB(filePath)  
        self.writeMetaEpos(filePath)
        self.writeMetaEneg(filePath)
        self.writeMetaAux(filePath)
        self.writeMetaSm(filePath)

    def writeILASPMeteTask(self, filePath):
        def parseMetaE(type_str): 
            str_all_rules = '\n'
            if type_str == 'pos':
                examples = self.positiveE.interpretations
            else:
                examples = self.negativeE.interpretations
            for value in examples:
                complement = self.universe - value
                value_str = '{' + ', '.join(value) + '}'
                complement_str = '{' + ', '.join(complement) + '}'
                str_all_rules = str_all_rules + f"#{type_str}({value_str}, {complement_str}).\n"
            return str_all_rules
        def parseMetaU(): 
            str_all_SM = '\n'
            for atom in self.universe:
                str_all_SM = str_all_SM + f"#modeh({atom}).\n#modeb({atom}).\n"
            return str_all_SM
        self.background.writedownILASP(filePath)
        with open(filePath, 'a') as file_e: 
            file_e.write(parseMetaE('pos'))
            file_e.write(parseMetaE('neg'))
            file_e.write(parseMetaU())




    def refreshUpperBound(self):
        upperNo = len(self.negativeE.interpretations)
        for inter in self.positiveE.interpretations:
            upperNo = upperNo + len(inter)
        self.upperBound = upperNo

    def writeTaskILSM(self, filePath):
        self.writeUandBILSM(filePath)
        self.writeExamplesILSM(filePath)
        self.refreshUpperBound()

    def checkSolILSM(self):
        if any(item in self.negativeE.interpretations for item in self.positiveE.interpretations):
            print('c4')
            return False,'(c4)'
        if any(s1.issubset(s2) or s2.issubset(s1) for s1, s2 in combinations(self.positiveE.interpretations, 2)):
            print('c1')
            return False,'(c1)'
        #判断(c2)
        for rul in self.background.rules:
            for interp in self.positiveE.interpretations:
                if not rul.satisfied(interp):
                    print('c2')
                    return False,'(c2)'
        #判断(c3)
        if (self.universe in self.negativeE.interpretations) and (self.background.reductLFP(self.universe) == self.universe):
            print('c3')
            return False,'(c3)'
        return True,''

    def parseModel(self, stableModelSet):
        solution = NLP()
        last_rule_head = [item.removeprefix('lastRule(').removesuffix(')') + ',' for item in stableModelSet if item.startswith("lastRule(")]
        last_rule_pos = [item.removeprefix('rulePos(').removesuffix(')') for item in stableModelSet if item.startswith("rulePos(")]
        last_rule_neg = [item.removeprefix('ruleNeg(').removesuffix(')') for item in stableModelSet if item.startswith("ruleNeg(")]
        for head_label in last_rule_head:
            head = head_label.split(',')[1]
            pos = {item.removeprefix(head_label) for item in last_rule_pos if item.startswith(head_label)}
            neg = {item.removeprefix(head_label) for item in last_rule_neg if item.startswith(head_label)}
            rule = Rule()
            rule.refreshRuleFromAttributes(head, pos, neg)
            solution.appProgram(rule)
        return solution

   
    def parseModelILASP(self, stableModelStr):
        solution = NLP()
        for line in stableModelStr.split('\n'):
            ruleStr = line.strip()
            #ruleStr = line
            if len(ruleStr) > 0:
                ruleILASP = Rule()
                ruleILASP.readRuleFromLine(ruleStr,';')
                solution.appProgram(ruleILASP)
        return solution

    def modelParseWriteILASP(self, stableModelStr, task_file):
        sol = self.parseModelILASP(stableModelStr)
        sol.writedown(task_file)
        return len(sol.rules),sol.countLength()


    def modelParseWrite(self, stableModelSet, task_file):
        sol = self.parseModel(stableModelSet)
        sol.writedown(task_file)
        return sol.countLength()

    def record_to_excel(self, filename, sheet_name, task_name, result, process_time, cardinality, length):
        workbook = openpyxl.load_workbook(filename)
        #sheet = workbook.active
        sheet = workbook[sheet_name]
        sheet.append([task_name, result, process_time, cardinality, length])
        workbook.save(filename)


    def writeTXTtask(self, filePath):
        str_all_rules = '#B starts\n'
        for r in self.background.rules:
            str_all_rules = str_all_rules + r.toStr() + '\n'
        str_all_rules = str_all_rules + '#B ends\n'
        str_all_pos = '#E+ starts\n'
        for e in self.positiveE.interpretations:
            str_all_pos = str_all_pos + "{" + ", ".join(e) + "}\n"
        str_all_pos = str_all_pos + '#E+ ends\n'
        str_all_neg = '#E- starts\n'
        for e in self.negativeE.interpretations:
            str_all_neg = str_all_neg + "{" + ", ".join(e) + "}\n"
        str_all_neg = str_all_neg + '#E- ends'
        str_task = str_all_rules + str_all_pos + str_all_neg
        with open(filePath, 'w') as file_e:
            file_e.write(str_task)
        return str_task

