e :- c,b.
f :- a,c.
d :- b,not c.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, d, c, e}, {}).
#neg({a, b, f, d, c}, {e}).

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
