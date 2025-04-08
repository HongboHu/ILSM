d :- b,not c.
f :- a,d.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, d, c, e}, {}).
#neg({a}, {b, f, d, c, e}).
#neg({a, b, f, c, e}, {d}).

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
