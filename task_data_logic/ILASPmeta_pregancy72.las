e :- d,b.
c :- b,not d.
a.
d :- b,not c.
b.
e :- c,b.


#neg({d, f}, {c, a, e, b}).

#modeh(a).
#modeb(a).
#modeh(d).
#modeb(d).
#modeh(e).
#modeb(e).
#modeh(c).
#modeb(c).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
