a.
d :- b,not c.
f :- a,d.

#pos({a, b, f, c, e}, {d}).

#neg({d, e, f}, {c, a, b}).
#neg({a, b, f, d, c, e}, {}).
#neg({}, {a, d, c, e, b, f}).

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
