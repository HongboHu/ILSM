e :- c,b.
b.
e :- d,b.
d :- b,not c.
c :- b,not d.
a.
f :- a,c.
f :- a,d.

#pos({a, b, f, d, e}, {c}).

#neg({f}, {a, b, d, c, e}).
#neg({d, b, e}, {a, c, f}).
#neg({}, {a, c, e, d, b, f}).
#neg({c, f}, {d, a, b, e}).

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
