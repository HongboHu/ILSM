b.
c :- b,not d.

#pos({a, b, f, d, e}, {c}).

#neg({}, {a, d, c, e, b, f}).
#neg({d, c, a, b}, {e, f}).
#neg({b, e}, {c, a, d, f}).

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
