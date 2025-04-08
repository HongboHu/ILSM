c :- b,not d.
d :- b,not c.
e :- d,b.
f :- a,c.
f :- a,d.
b.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, d, c, e, b, f}).
#neg({a, d, b, f}, {c, e}).

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
