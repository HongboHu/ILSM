ILSMmin (Inductively Learning from Stable Models and returning a MINimal solution)


This software allows to learn NLP from stable models via algorithm ILSMmin and ILASP. 
The solver Clingo 5.2.2 and python 3.11.5 are installed. 
Please ensure the ILASP are also installed. For details, refer to https://www.ilasp.com/ 


After the installation, run the command 
"python compare.py" 
to see the result. 
If you want to replace the tested task, please directly modify the file compare.py.
The task set Med_100_1_6 is stored in the directory medical_source. 
The task sets Ara_100_0_15 and Tce_240_22_40 are stored in the directory GRN_source. 

Those intermediate datas are stored in the directory task_data_logic. 
for example, the file "ILASPmeta_arabidopsis_12_1_1.las" corresponds to the original task "arabidopsis_12_1_1.txt" in the directory GRN_source. 
Furthermore, files like "ILASPmeta_arabidopsis_12_1_1.las" can be directed used as the input of ILASP via the command 
"ILASP --version=4 -nc -ml=1000 --max-rule-length=1000 -q ILASPmeta_arabidopsis_12_1_1.las".

The running results of "python compare.py" will be stored in the directory solutions. 
File "record_comparison.xlsx" in this directory has already been written down all the results of our comparison experiments. 
Namely, the statistic result in the paper comes from these results. 
For more details about the solutions, please refer to the "readme.txt" there.
