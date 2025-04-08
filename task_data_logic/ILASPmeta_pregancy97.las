e :- d,b.
f :- a,c.
b.
c :- b,not d.


#neg({a, f, c, d, e}, {b}).
#neg({a, b, f, d, e}, {c}).

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
