f :- a,c.
f :- a,d.
d :- b,not c.
b.
a.

#pos({a, b, f, d, e}, {c}).

#neg({d, f}, {c, a, b, e}).
#neg({a}, {b, f, d, c, e}).
#neg({c, a, b, f}, {d, e}).
#neg({a, b, d, c, e}, {f}).

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
