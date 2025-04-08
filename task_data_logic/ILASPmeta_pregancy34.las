f :- a,c.
e :- d,b.
c :- b,not d.
b.
e :- c,b.

#pos({a, b, f, c, e}, {d}).


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
