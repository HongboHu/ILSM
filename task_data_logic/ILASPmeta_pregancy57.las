e :- c,b.
f :- a,c.
a.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, d, c, e}, {}).
#neg({b, e}, {d, a, c, f}).
#neg({d, c, e, f}, {a, b}).
#neg({c, e}, {d, a, b, f}).

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
