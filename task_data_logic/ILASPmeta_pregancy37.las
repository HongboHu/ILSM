b.
a.
d :- b,not c.
f :- a,d.
c :- b,not d.
f :- a,c.
e :- d,b.

#pos({a, b, f, d, e}, {c}).

#neg({d, b, f}, {a, c, e}).
#neg({a, c}, {d, b, e, f}).
#neg({c}, {a, b, f, d, e}).
#neg({d, c, e}, {a, b, f}).

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
