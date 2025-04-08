c :- b,not d.
e :- d,b.
a.
f :- a,d.


#neg({a, d}, {c, b, e, f}).
#neg({a}, {b, f, c, d, e}).

#modeh(a).
#modeb(a).
#modeh(d).
#modeb(d).
#modeh(c).
#modeb(c).
#modeh(e).
#modeb(e).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
