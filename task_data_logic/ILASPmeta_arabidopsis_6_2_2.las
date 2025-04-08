a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.

#pos({m, f}, {g, o, a, b, e, c, n, j, d, h}).

#neg({}, {f, g, o, a, b, m, e, c, n, j, d, h}).
#neg({b, h, e}, {f, g, o, a, n, m, d, c, j}).

#modeh(f).
#modeb(f).
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
