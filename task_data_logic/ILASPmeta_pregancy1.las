e :- c,b.
a.
b.
e :- d,b.
f :- a,c.
c :- b,not d.

#pos({a, b, f, d, e}, {c}).


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
