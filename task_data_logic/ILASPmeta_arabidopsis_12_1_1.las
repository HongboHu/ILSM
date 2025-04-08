c :- not m,not e.
e :- g,not j.
m :- f,not e,not g.
j :- g,not k.
g :- not m.
h :- not m.
n :- n,e,o,a.
a :- b,g.
j :- g,not l.
f :- not g.
o :- g.
i :- i,not o.


#neg({f, i, o, k, n, d, e, b, j, l}, {g, a, m, h, c}).

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
