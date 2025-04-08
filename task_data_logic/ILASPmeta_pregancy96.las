c :- b,not d.
a.
e :- c,b.
f :- a,c.
f :- a,d.

#pos({a, b, f, c, e}, {d}).

#neg({f}, {a, b, d, c, e}).

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
