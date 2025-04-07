% # AP3,UFO,FUL,FT,AP1,EMF1,LFY,AP2,WUS,AG,LUG,CLF,TFL1,PI,SEP
% # 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
% # a,b,c,d,e,f,g,h,i,j,k,l,m,n,o
a :- e,o,a,n.             
a :- o,a,j,n.            
a :- b,g.             
b :- b.                    
c :- not e,not m.          
d :- not f.   
e :- not j,not m .        
e :- d,not j.              
e :- g,not j.              
f :- not g.                 
g :- not m.                
g :- not f.                 
h :- not m.                
i :- i,not o.              
i :- i,not j.              
j :- not m,not h.         
j :- o,g,j.              
j :- g,not l.             
j :- g,not k.             
j :- g,not e.              
j :- g,i.                  
j :- g,not h.              
m :- f,not e,not g.        
n :- e,o,a,n.            
n :- o,a,j,n.          
n :- g,j.                 
n :- g,a.                  
o :- g.                    