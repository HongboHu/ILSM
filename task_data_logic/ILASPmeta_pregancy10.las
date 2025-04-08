d :- b,not c.
c :- b,not d.
f :- a,c.
f :- a,d.
a.

#pos({a, b, f, d, e}, {c}).


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
