sig f. %%% f.sig

kind tm, ty	type.

type arr	ty -> ty -> ty.
type all	(ty -> ty) -> ty.

type app	tm -> tm -> tm.
type abs        (tm -> tm) -> tm.

type inst	ty -> ty -> o.
type insts	ty -> ty -> o.
type of         tm -> ty -> o.

type step	tm -> tm -> o.
type steps	tm -> tm -> o.
