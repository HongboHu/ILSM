f :- a,d.
e :- d,b.
d :- b,not c.
c :- b,not d.
b.
e :- c,b.
a.

#pos({a, b, f, c, e}, {d}).

#neg({b}, {a, f, c, d, e}).
#neg({d}, {a, b, f, c, e}).

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
