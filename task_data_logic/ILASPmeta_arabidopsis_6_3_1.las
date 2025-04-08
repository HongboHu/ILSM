a :- b,g.
c :- not m,not e.
b :- b.
n :- n,e,o,a.
j :- g,not e.
e :- d,not j.

#pos({g, o, d, h, n, c, j}, {f, i, a, b, e, m}).

#neg({f, g, i, o, a, n, h, b, c, j}, {m, d, e}).

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
