c :- b,not d.
d :- b,not c.
f :- a,d.


#neg({b, f, d, c, e}, {a}).
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
