b.
f :- a,c.
d :- b,not c.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, c, d, e, b, f}).

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
