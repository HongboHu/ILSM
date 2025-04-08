d :- b,not c.
a.
f :- a,c.
e :- d,b.
e :- c,b.
b.
f :- a,d.

#pos({a, b, f, c, e}, {d}).


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
