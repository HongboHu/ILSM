f :- a,c.
c :- b,not d.
d :- b,not c.
f :- a,d.
e :- d,b.
a.
b.

#pos({a, b, f, c, e}, {d}).

#neg({}, {a, c, d, e, b, f}).
#neg({a, b, f, d, c, e}, {}).
#neg({c, a, b}, {d, e, f}).
#neg({a, b, d, c, e}, {f}).

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
