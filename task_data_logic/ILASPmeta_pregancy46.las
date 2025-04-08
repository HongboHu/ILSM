d :- b,not c.
e :- d,b.
a.
f :- a,d.
c :- b,not d.
e :- c,b.

#pos({a, b, f, d, e}, {c}).


#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(c).
#modeb(c).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
