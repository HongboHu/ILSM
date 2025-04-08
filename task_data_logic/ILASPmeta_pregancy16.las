f :- a,c.
e :- d,b.
a.
f :- a,d.
d :- b,not c.

#pos({a, b, f, c, e}, {d}).

#neg({a, d, f}, {c, b, e}).
#neg({b, e}, {d, a, c, f}).
#neg({c, a, b, f}, {d, e}).
#neg({a, b, e}, {d, c, f}).

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
