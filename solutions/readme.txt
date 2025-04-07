The sheet ILASPminL stores the results from ILASP.
The sheet ILSMminR stores the results from ILSMmin.


The table head "task_file_name"	records the name of the tested task.

The table head "result(fail/success)"	records the running result of the program. 
ETL (Exceeding Time Limit) and OOM (Out Of Memory) corresponds to "fail(time)" and "fail(mem)"respectively. 
If the ILASP recognize an unsolvable task, it will return "fail(unsat)".
If the ILSMminR recognize an unsolvable task, it will return "fail(cX)" where $X \in \{ 1,2,3,4 \}$. 
The cX corresponds to the specific reason of the proposition in the paper. 

The table head "cardinality" is the amount of the rules in the solution. 

The table head "length" is the total atoms of appearing in the solution. 


