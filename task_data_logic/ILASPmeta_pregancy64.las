f :- a,c.
c :- b,not d.
f :- a,d.
a.
e :- d,b.
d :- b,not c.
b.


#neg({}, {a, c, d, e, b, f}).
#neg({a, c}, {d, b, e, f}).

#modeh(a).
#modeb(a).
#modeh(c).
#modeb(c).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
