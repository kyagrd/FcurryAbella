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
of N T :- of N U, eqt U T K.

eqt F F K :- of' F K.                % reflexive
eqt F G K :- of' F K, of' G K, step' F F1, eqt F1 G K. % step left
eqt F G K :- of' F K, of' G K, step' G G1. eqt F G1 K. % step right

ins (all K T) (T U) :- of' U K.

ins* T T.
ins* T S :- ins T U, ins* U S.

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
step' (apt (abt K1 F) G) (F G).
step' (abt K F) (abt K F') :- pi a\ step' (F a) (F' a).

steps' F F.
steps' F G :- step' F F', steps' F' G.
