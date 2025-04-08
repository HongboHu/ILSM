e :- c,b.
c :- b,not d.
e :- d,b.


#neg({a, d, b}, {c, e, f}).
#neg({a, d, e}, {c, b, f}).
#neg({a, b, f, c, e}, {d}).

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
