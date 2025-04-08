a.
d :- b,not c.
f :- a,d.
c :- b,not d.
f :- a,c.
e :- d,b.
e :- c,b.
b.

#pos({a, b, f, c, e}, {d}).

#neg({b, f, d, c, e}, {a}).
#neg({e}, {a, b, f, d, c}).

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
