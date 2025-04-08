e :- d,b.
d :- b,not c.
f :- a,d.
e :- c,b.
b.
f :- a,c.
c :- b,not d.
a.

#pos({a, b, f, d, e}, {c}).

#neg({a, c, e, f}, {d, b}).

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
