color(r;g;b).
v(1..4).
{set(V, C)} :- v(V), color(C).
% :- not set(V, r), not set(V, b), not set(V, g), v(V).
% :- v(V), not set(V, C) : color(C).
:- not set(V, C) : color(C); v(V).