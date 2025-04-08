a.
e :- c,b.
f :- a,d.
c :- b,not d.
e :- d,b.
d :- b,not c.
f :- a,c.
b.

#pos({a, b, f, c, e}, {d}).

#neg({d, a, b}, {c, e, f}).
#neg({c, a, d, f}, {b, e}).
#neg({d, e}, {c, a, b, f}).
#neg({a, b, f}, {d, c, e}).

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
