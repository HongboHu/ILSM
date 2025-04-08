d :- b,not c.
b.
c :- b,not d.
e :- d,b.
f :- a,d.
f :- a,c.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, c, d, e, b, f}).
#neg({d, b, e}, {a, c, f}).

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
