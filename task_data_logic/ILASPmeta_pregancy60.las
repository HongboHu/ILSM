f :- a,d.
c :- b,not d.
f :- a,c.
b.
d :- b,not c.
e :- c,b.
e :- d,b.
a.

#pos({a, b, f, d, e}, {c}).

#neg({a, d, e, f}, {c, b}).

#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(d).
#modeb(d).
#modeh(c).
#modeb(c).
#modeh(e).
#modeb(e).
