c :- b,not d.
e :- d,b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, c, d, e, b, f}).
#neg({a, d, b, f}, {c, e}).
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
