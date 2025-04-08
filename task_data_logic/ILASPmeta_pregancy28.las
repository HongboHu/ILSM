a.
e :- b,d.
c :- b,not d.
d :- b,not c.
f :- a,d.

#pos({a, d, f, e, b}, {c}).

#neg({f}, {a, d, e, c, b}).
#neg({a}, {d, f, e, c, b}).
#neg({a, d, f, e, b}, {c}).

#modeh(a).
#modeb(a).
#modeh(d).
#modeb(d).
#modeh(f).
#modeb(f).
#modeh(e).
#modeb(e).
#modeh(c).
#modeb(c).
#modeh(b).
#modeb(b).
