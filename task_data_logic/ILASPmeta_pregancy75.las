c :- b,not d.
a.
f :- a,c.
e :- d,b.
f :- a,d.
d :- b,not c.
b.
e :- c,b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, d, c, e, b, f}).
#neg({c, e}, {d, a, b, f}).
#neg({d}, {a, b, f, c, e}).

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
