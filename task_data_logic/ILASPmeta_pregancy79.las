a.
f :- a,d.
e :- d,b.
c :- b,not d.
f :- a,c.
d :- b,not c.
b.

#pos({a, b, f, d, e}, {c}).

#neg({a, b, d, c, e}, {f}).

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
