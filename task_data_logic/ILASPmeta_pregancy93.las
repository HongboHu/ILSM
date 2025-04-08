e :- d,b.
c :- b,not d.
d :- b,not c.
a.
b.
f :- a,c.
e :- c,b.


#neg({b, f, d, c, e}, {a}).
#neg({a, d}, {c, b, e, f}).
#neg({d, b, e, f}, {a, c}).

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
