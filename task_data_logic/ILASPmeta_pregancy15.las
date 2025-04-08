e :- d,b.
c :- b,not d.
f :- a,c.
e :- c,b.
a.
d :- b,not c.
b.
f :- a,d.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, d, e, c, b, f}).

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
