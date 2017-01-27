% vim: ts=2: sw=2: expandtab: syntax=lprolog: ai:
sig fw. %%% fw.sig

kind tm, ty, ki  type.

type star  ki.
type karr  ki -> ki -> ki.

% type constructors
type arr  ty -> ty -> ty.         % function type
type all  ki -> (ty -> ty) -> ty. % universally quantified type
type apt  ty -> ty -> ty.         % type application
type abt  ki -> (ty -> ty) -> ty. % type abstraction

% terms
type app  tm -> tm -> tm.    % application
type abs  (tm -> tm) -> tm.  % abstraction

type ins  ty -> ty -> o. % type insantiation (one variable)
type ins* ty -> ty -> o. % type insantiation (many variables)

type of   tm -> ty -> o.  % typing judgemnet
type of'  ty -> ki -> o.  % kinding judgemnet
type eqt  ty -> ty -> ki -> o. % type equality (requires well-kinded)

type step   tm -> tm -> o. % one step reduction of terms
type steps  tm -> tm -> o. % many steps of term reduction

type step'  ty -> ty -> o. % one step reduction of types
type steps' ty -> ty -> o. % many steps of type reduction
