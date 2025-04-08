e :- d,b.
f :- a,d.
f :- a,c.
a.
c :- b,not d.
e :- c,b.
d :- b,not c.

#pos({a, b, f, d, e}, {c}).


#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
#modeh(c).
#modeb(c).
