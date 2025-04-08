f :- a,d.
c :- b,not d.

#pos({a, b, f, d, e}, {c}).

#neg({c, d}, {a, b, e, f}).
#neg({d, c, b}, {a, e, f}).
#neg({c, e}, {d, a, b, f}).
#neg({a, b, f, c, e}, {d}).

#modeh(a).
#modeb(a).
#modeh(b).
#modeb(b).
#modeh(f).
#modeb(f).
#modeh(d).
#modeb(d).
#modeh(c).
#modeb(c).
#modeh(e).
#modeb(e).
