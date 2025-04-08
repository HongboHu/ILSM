e :- c,b.
d :- b,not c.
f :- a,d.
b.

#pos({a, b, f, c, e}, {d}).

#neg({b, f}, {d, a, c, e}).
#neg({b, e}, {d, a, c, f}).
#neg({b, f, d, c, e}, {a}).
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
