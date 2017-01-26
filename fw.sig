% vim: ts=2: sw=2: expandtab: syntax=lprolog: ai:
sig fw. %%% fw.sig

kind tm, ty, ki  type.

type star  ki.
type karr  ki -> ki -> ki.

type arr  ty -> ty -> ty.
type all  ki -> (ty -> ty) -> ty.
type apt  ty -> ty -> ty.
type abt  ki -> (ty -> ty) -> ty.

type app  tm -> tm -> tm.
type abs  (tm -> tm) -> tm.

type inst  ty -> ty -> o.
type insts ty -> ty -> o.

type of   tm -> ty -> o.
type of'  ty -> ki -> o.
type eqt  ty -> ty -> ki -> o.

type step   tm -> tm -> o.
type steps  tm -> tm -> o.

type step'  ty -> ty -> o.
type steps' ty -> ty -> o.
