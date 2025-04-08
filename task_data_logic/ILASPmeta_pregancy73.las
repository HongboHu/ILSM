e :- c,b.
c :- b,not d.
a.
f :- a,c.
f :- a,d.
d :- b,not c.
e :- d,b.
b.


#neg({a, b, f, d, c, e}, {}).
#neg({b, f, d, c, e}, {a}).

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
