d :- b,not c.
c :- b,not d.
f :- a,d.
e :- d,b.
e :- c,b.
a.
f :- a,c.
b.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, f, c, e}, {d}).

#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(c).
#modeb(c).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
