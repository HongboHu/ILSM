f :- a,c.
e :- c,b.
e :- d,b.
f :- a,d.

#pos({a, b, f, c, e}, {d}).

#neg({d, b, e}, {a, c, f}).
#neg({a, d, e}, {c, b, f}).
#neg({a, b, f, d, c, e}, {}).
#neg({d, a, c, e}, {b, f}).

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
