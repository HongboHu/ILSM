a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.


#neg({}, {f, g, i, o, k, a, n, e, b, m, d, c, j, l}).
#neg({f, g, i, o, k, d, m, e, n, b, j, c, l}, {a}).
#neg({k, f, j, a}, {g, i, o, n, e, b, m, d, c, l}).

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
#modeh(i).
#modeb(i).
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
