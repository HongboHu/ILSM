
%# a,b,c,d,e,f,g,h,i,j
b  :- a.                             
c  :- c,not b,not j,not f,not d.    
c  :- f,not b,not j,not d.          
c  :- j,c,f,not b,not d.
c  :- c,f,d,not b,not j.            
c  :- b,c,f,not j,not d.            
d  :- not e,not c,not h.             
d  :- h,d,not e,not c.               
d  :- e,d,not c,not h.               
d  :- c,d,not e,not h.               
e  :- e,not b,not j,not f,not d.    
e  :- f,not b,not j,not d.          
e  :- e,j,f,not b,not d.            
e  :- e,f,d,not b,not j.            
e  :- e,b,j,f,not d.                
f  :- h.                             
g  :- g,not f,not d.                 
g  :- d,not f.                       
g  :- g,f,d.                         
h  :- j.                            
i  :- i,not f,not d.                 
i  :- f,not d.                       
i  :- i,f,d.                         
j  :- g,j,not e,not i,not c,not h. 
