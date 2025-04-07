
% # a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at
a :- a.            
b :- b.            
c :- c.            
d :- c,not k.     
e :- g.            
e :- not d.        
f :- b,a,not e.    
g :- a,f.          
g :- a,d.          
h :- f.            
i :- f,d.          
i :- g.            
j :- i,f,not k.  
k :- j.          
l :- o,j.       
m :- j.          
n :- m.          
o :- n.          
p :- m.          
q :- m.          
r :- s.          
s :- o,l,p,j. 
s :- o,p,j,h.  
t :- q.          
t :- aa.          
aa :- r,ab.       
ab :- r.          
ac :- s.          
ad :- t.          
ae :- ad.          
af :- ac.          
ag :- ae.          
ah :- ab.          
ai :- ab.          
aj :- af.          
ak :- ag.          
al :- ag.          
am :- ah.          
an :- not ai.      
ao :- ak.          
ap :- am.          
aq :- ao.          
ar :- ap,al.       
as :- not an.      
at :- aj.          
