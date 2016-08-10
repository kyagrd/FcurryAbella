module f. %%% f.mod

inst (all T) (T U).
inst (all T) (all T1) :- pi a\ inst (T a) (T1 a).
inst (arr T U) (arr T1 U) :- inst T T1.
inst (arr T U) (arr T U1) :- inst U U1.

% insts T T.
% insts S T :- inst S S1, insts S1 T.

of (app M N) T :- of M (arr U T), of N U.
of (abs R) (arr T U) :- pi x\ (of x T => of (R x) U).
of N T :- inst T U, of N U. 
of N U :- inst T U, of N T. 

step (app M N) (app M' N) :- step M M'. 
step (app M N) (app M N') :- step N N'. 
step (abs R) (abs R') :- pi x\ step (R x) (R' x).
step (app (abs R) N) (R N).

steps M M.
steps M N :- step M M', steps M' N.
