f :- a,d.
e :- c,b.
a.
f :- a,c.
d :- b,not c.


#neg({d, e, f}, {c, a, b}).
#neg({a, b}, {c, d, e, f}).
#neg({}, {a, d, c, e, b, f}).

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
