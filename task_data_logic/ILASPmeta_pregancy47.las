e :- c,b.
c :- b,not d.
f :- a,d.
d :- b,not c.
b.
e :- d,b.
f :- a,c.
a.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, c, e, d, b, f}).
#neg({a, b, f}, {d, c, e}).

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
