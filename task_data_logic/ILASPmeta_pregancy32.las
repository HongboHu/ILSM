e :- d,b.
c :- b,not d.
d :- b,not c.
f :- a,d.
b.

#pos({a, b, f, d, e}, {c}).

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
