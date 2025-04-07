%#a,b,c,d,e,f,g,h,i,j,k,l
b :- a.                    
c :- c,not b,not i.        
c :- b,not i.              
c :- b,i,c. 
d :- d,not b,not i.        
d :- b,not i.              
d :- b,i,d.                
e :- c.                    
f :- f,not g,not l,not e,not k,not i. 
f :- l,not e,not g,not k,not i.       
f :- k,not e,not g,not i.              
f :- l,i,f,not e,not g,not k.         
f :- k,i,f,not e,not g,not l.         
f :- l,k,i,not e,not g.               
f :- l,g,f,not e,not k,not i.         
f :- g,k,f,not e,not l,not i.         
f :- l,g,k,not e,not i.               
f :- l,g,k,f,i,not e.                 
f :- e,l,f,not g,not k,not i.         
f :- e,k,f,not l,not g,not i.         
f :- e,l,k,not g,not i.               
f :- l,e,k,f,i,not g.                 
f :- g,l,e,k,f,not i.                 
g :- g,not k,not f,not d.              
g :- d,not k,not f.
g :- g,k,d,not f.                      
g :- g,f,d,not k.                      
h :- h,not e,not g,not k,not i.        
h :- k,not e,not g,not i.              
h :- k,i,h,not e,not g.                
h :- g,k,h,not e,not i.                
h :- e,k,h,not g,not i.                
i :- i,not g,not k,not f,not h,not j. 
i :- j,not g,not k,not f,not h.       
i :- k,j,i,not g,not f,not h.         
i :- j,i,h,not g,not k,not f.         
i :- g,not k,not j,not f,not h.       
i :- g,k,i,not j,not f,not h.         
i :- g,j,not f,not h.                  
i :- g,i,h,not k,not j,not f.         
i :- g,j,h,not k,not f.               
i :- g,k,h,j,i,not f.                 
i :- j,i,f,not g,not k,not h.         
i :- g,i,f,not k,not j,not h.         
i :- g,j,f,not k,not h.               
i :- g,k,f,j,i,not h.                 
i :- g,f,h,j,i,not k.                 
j :- g.                     
j :- i.                     
k :- i.                     
k :- j.                    
l :- k,not j,not i.       
l :- j,not i.                         
l :- k,j,i.                          
