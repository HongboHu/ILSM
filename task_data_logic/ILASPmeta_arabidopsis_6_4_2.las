a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.

#pos({m, f}, {g, i, o, k, a, n, e, h, b, d, c, j}).
#pos({g, o, d, h, n, c, j}, {f, i, k, a, b, e, m}).

#neg({f, i, o, k, n, h, e, b, c, j, m}, {d, g, a}).
#neg({d, f, o, a}, {g, i, k, n, e, h, b, m, c, j}).

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
