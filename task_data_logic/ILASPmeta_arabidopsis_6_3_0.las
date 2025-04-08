a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.

#pos({g, o, d, h, n, c, j}, {b, m, e, a}).


#modeh(g).
#modeb(g).
#modeh(o).
#modeb(o).
#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(m).
#modeb(m).
#modeh(e).
#modeb(e).
#modeh(c).
#modeb(c).
#modeh(n).
#modeb(n).
#modeh(j).
#modeb(j).
#modeh(d).
#modeb(d).
#modeh(h).
#modeb(h).
