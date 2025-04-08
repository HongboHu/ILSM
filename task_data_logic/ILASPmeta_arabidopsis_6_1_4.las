a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.


#neg({m}, {f, g, o, k, a, n, e, b, d, c, j, l}).
#neg({f, o, k, m, c, j, l}, {g, a, n, e, b, d}).
#neg({m, f, g, a}, {o, k, n, e, b, d, c, j, l}).
#neg({g, o, k, a, d, e, n, m, j, l}, {b, c, f}).

#modeh(g).
#modeb(g).
#modeh(a).
#modeb(a).
#modeh(n).
#modeb(n).
#modeh(e).
#modeb(e).
#modeh(f).
#modeb(f).
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
