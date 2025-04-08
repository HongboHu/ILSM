b.
e :- d,b.
e :- c,b.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, c, d, e, b, f}).
#neg({a, b}, {d, c, e, f}).
#neg({c, b, e, f}, {a, d}).

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
