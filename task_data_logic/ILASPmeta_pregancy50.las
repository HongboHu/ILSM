f :- a,d.
c :- b,not d.
b.

#pos({a, b, f, c, e}, {d}).

#neg({a, b, f, d, e}, {c}).
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
