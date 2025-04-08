f :- a,c.
e :- c,b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, c, e, d, b, f}).
#neg({a, d, b, e}, {c, f}).

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
