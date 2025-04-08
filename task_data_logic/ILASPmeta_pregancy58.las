e :- c,b.
d :- b,not c.
b.
e :- d,b.
c :- b,not d.
f :- a,c.
a.


#neg({a, b, e}, {d, c, f}).
#neg({b, e, f}, {d, a, c}).
#neg({a, b, f, d, c, e}, {}).
#neg({c, a, d, f}, {b, e}).

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
