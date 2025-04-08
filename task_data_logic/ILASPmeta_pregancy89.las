f :- a,c.
d :- b,not c.
e :- c,b.
a.
e :- d,b.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, d, c, e}, {}).
#neg({d, c, e, f}, {a, b}).
#neg({d, b, e, f}, {a, c}).

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
