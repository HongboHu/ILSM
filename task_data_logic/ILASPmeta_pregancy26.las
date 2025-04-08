e :- d,b.
c :- b,not d.
b.
f :- a,c.
a.
f :- a,d.
d :- b,not c.
e :- c,b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, d, e, c, b, f}).
#neg({a, b, f, d, c, e}, {}).

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
