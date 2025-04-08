f :- a,c.
a.
e :- c,b.
c :- b,not d.
d :- b,not c.
e :- d,b.
b.

#pos({a, b, f, c, e}, {d}).


#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(c).
#modeb(c).
#modeh(e).
#modeb(e).
#modeh(d).
#modeb(d).
