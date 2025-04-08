d :- b,not c.
c :- b,not d.
e :- d,b.
b.
e :- c,b.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, d, c, e, b, f}).
#neg({d}, {a, b, f, c, e}).
#neg({c, f}, {d, a, b, e}).

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
