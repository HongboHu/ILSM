f :- a,d.
c :- b,not d.
e :- d,b.

#pos({a, b, f, d, e}, {c}).

#neg({d, c, f}, {a, b, e}).
#neg({a}, {b, f, d, c, e}).
#neg({}, {a, d, c, e, b, f}).
#neg({f}, {a, b, d, c, e}).

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
