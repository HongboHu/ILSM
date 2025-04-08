j :- g,not e.
j :- g,o,j.
j :- g,not h.
b :- b.
e :- not m,not j.
h :- not m.
n :- g,a.
i :- i,not j.
j :- g,not k.
f :- not g.
j :- g,not l.
m :- f,not e,not g.

#pos({g, o, d, h, n, c, j}, {f, i, k, a, b, e, m, l}).


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
#modeh(l).
#modeb(l).
