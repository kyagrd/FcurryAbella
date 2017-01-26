% vim: ts=2: sw=2: expandtab: syntax=lprolog: ai 
module fw. %%% fw.mod

of' (arr T U) star :- of' T star, of' U star.
of' (all K T) star :- pi a\ of' a K => of' (T a) star.
of' (apt F G) K2 :- of' F (karr K1 K2), of' G K1.
of' (abt K1 F) (karr K1 K2) :-  pi a\ of' a K1 => of' (F a) K2.

of (app M N) T :- of M (arr U T), of N U.
of (abs R) (arr T U) :- pi x\ of x T => of (R x) U, of' (arr T U) star.
of N (all K T) :- pi a\ of' a K => of N (T a), pi a\ of' a K => of' (T a) star.
of N (T U) :- of' U K, of N (all K T).
of N T :- of N U, eqt T U K.

eqt F F K :- of' F K.
eqt F G K :- of' F K, step' F F1, eqt F1 G K.
eqt F G K :- of' G K, step' G G1, eqt F G1 K.
eqt (arr T1 U1) (arr T2 U2) star :- eqt T1 T2 star, eqt U1 U2 star.
eqt (all K T) (all K U) star :- pi a\ of' a K => eqt (T a) (U a) star.
eqt (apt F1 G1) (apt F2 G2) K2 :- eqt F1 F2 (karr K1 K2), eqt G1 G2 K1.
eqt (abt K1 F) (abt K1 G) (karr K1 K2) :- pi a\ of' a K1 => eqt (F a) (G a) K2.

inst (all K T) (T U) :- of' U K.

insts T T.
insts T S :- inst T U, insts U S.

step (app M N) (app M' N) :- step M M'.
step (app M N) (app M N') :- step N N'.
step (abs R) (abs R') :- pi x\ step (R x) (R' x).
step (app (abs R) N) (R N).

steps M M.
steps M N :- step M M', steps M' N.

step' (arr T U) (arr T' U) :- step' T T'.
step' (arr T U) (arr T U') :- step' U U'.
step' (all K T) (all K U) :- pi a\ step' (T a) (U a).
step' (apt F G) (apt F' G) :- step' F F'. 
step' (apt F G) (apt F G') :- step' G G'. 
step' (abt K F) (abt K F') :- pi a\ step' (F a) (F' a).

steps' M M.
steps' M N :- step' M M', steps' M' N.

