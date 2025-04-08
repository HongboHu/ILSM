e :- d,b.
f :- a,d.
d :- b,not c.
f :- a,c.


#neg({f}, {a, b, d, c, e}).
#neg({a, b, f, d, c, e}, {}).
#neg({c, b, e}, {a, d, f}).
#neg({c, f}, {d, a, b, e}).

#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
#modeh(c).
#modeb(c).
