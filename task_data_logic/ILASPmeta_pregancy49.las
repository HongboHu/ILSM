b.
c :- b,not d.
f :- a,c.
e :- d,b.

#pos({a, b, f, d, e}, {c}).

#neg({f}, {a, b, d, c, e}).
#neg({a, b, f, d, c, e}, {}).
#neg({a, b}, {c, d, e, f}).

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
