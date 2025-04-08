a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.

#pos({g, o, d, h, n, c, j}, {k, a, b, m, e, l}).

#neg({}, {g, o, k, a, n, e, h, b, m, d, c, j, l}).
#neg({g, k, a, d, n, b, c, j, l}, {m, e, o, h}).

#modeh(g).
#modeb(g).
#modeh(a).
#modeb(a).
#modeh(n).
#modeb(n).
#modeh(e).
#modeb(e).
#modeh(h).
#modeb(h).
#modeh(o).
#modeb(o).
#modeh(k).
#modeb(k).
#modeh(b).
#modeb(b).
#modeh(m).
#modeb(m).
#modeh(d).
#modeb(d).
#modeh(c).
#modeb(c).
#modeh(j).
#modeb(j).
#modeh(l).
#modeb(l).
