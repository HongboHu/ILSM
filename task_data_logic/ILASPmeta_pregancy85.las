c :- b,not d.
f :- a,d.

#pos({a, b, f, d, e}, {c}).

#neg({a, d, e}, {c, b, f}).
#neg({c}, {a, b, f, d, e}).

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
