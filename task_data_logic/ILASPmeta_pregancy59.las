a.
f :- a,c.
e :- d,b.
f :- a,d.
c :- b,not d.

#pos({a, b, f, d, e}, {c}).

#neg({d, f}, {c, a, b, e}).
#neg({d, c, e, f}, {a, b}).
#neg({d, a, c, f}, {b, e}).
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
