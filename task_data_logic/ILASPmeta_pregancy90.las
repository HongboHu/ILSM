d :- b,not c.
b.
f :- a,c.
f :- a,d.
a.
e :- c,b.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, d, c, e}, {}).
#neg({b, f, d, c, e}, {a}).
#neg({a}, {b, f, d, c, e}).
#neg({b}, {a, f, d, c, e}).

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
