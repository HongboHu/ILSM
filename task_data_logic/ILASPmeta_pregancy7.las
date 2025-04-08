a.
f :- a,c.
c :- b,not d.
e :- c,b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, c, d, e, b, f}).
#neg({d, c, b, f}, {a, e}).

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
