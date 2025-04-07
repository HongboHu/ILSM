# CycD,Rb,CycE,CycA,CycB,p27,E2F,Cdc20,Cdh1,Ubch10
# a,b,c,d,e,f,g,h,i,j
a  :- a.             
b  :- not e,not a,not c,not d.           
b  :- f,not e,not a.                
g  :- not e,not b,not d.
g  :- f,not e,not b.                
c  :- g,not b.                  
d  :- g,not b,not i,not h.                 
d  :- g,not b,not j,not h.               
d  :- d,not b,not i,not h.                
d  :- d,not b,not j,not h.                 
e  :- not i,not h.                  
f  :- not e,not a,not c,not d.                 
f  :- f,not e,not a,not c.                
f  :- f,not e,not a,not d.               
h  :- e.                
i  :- not e,not d.                 
i  :- h.                
i  :- f,not e.                
j  :- not i.                 
j  :- j,i,h.                 
j  :- j,i,d.                
j  :- e,j,i.
