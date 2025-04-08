e :- c,b.
d :- b,not c.
a.
f :- a,c.
e :- d,b.

#pos({a, b, f, d, e}, {c}).


#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(c).
#modeb(c).
#modeh(e).
#modeb(e).
#modeh(d).
#modeb(d).
