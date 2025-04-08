b.
f :- a,c.
a.
d :- b,not c.
f :- a,d.


#neg({d, b}, {a, c, f}).

#modeh(a).
#modeb(a).
#modeh(c).
#modeb(c).
#modeh(d).
#modeb(d).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
