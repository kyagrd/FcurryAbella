# Type preservation in the Curry-style System F using Abella

The proof  (see `f.thm`) uses a lemma (`abs_arr`), which has not been proven
(that is, `skip`ped) in Abella. Believing the lemma is true, the proof is
fairly mechanic.

## Proof log from Abella's `-o` output 

Welcome to Abella 2.0.3
<a name="1"></a>
<pre class="code">
Abella < <b>Specification "f".</b>
Reading specification "f"

</pre>
<a name="2"></a>
<pre class="code">
Abella < <b>Close ty, tm.</b>

</pre>
<a name="3"></a>
<pre class="code">
Abella < <b>Define name : tm -> prop by 
nabla x, name x.</b>

</pre>
<a name="4"></a>
<pre class="code">
Abella < <b>Define fresh : tm -> o -> prop by 
nabla x, fresh x E.</b>

</pre>
<a name="5"></a>
<pre class="code">
Abella < <b>Define freshlist : tm -> olist -> prop by 
nabla x, freshlist x E.</b>

</pre>
<a name="6"></a>
<pre class="code">
Abella < <b>Theorem member_fresh : 
forall X L E, member E L -> freshlist X L -> fresh X E.</b>

</pre>
<a name="7"></a>
<pre class="code">

============================
 forall X L E, member E L -> freshlist X L -> fresh X E

member_fresh < <b>induction on 1.</b>
</pre>
<a name="8"></a>
<pre class="code">

IH : forall X L E, member E L * -> freshlist X L -> fresh X E
============================
 forall X L E, member E L @ -> freshlist X L -> fresh X E

member_fresh < <b>intros.</b>
</pre>
<a name="9"></a>
<pre class="code">

Variables: X L E
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H1 : member E L @
H2 : freshlist X L
============================
 fresh X E

member_fresh < <b>case H1.</b>
</pre>
<a name="10"></a>
<pre class="code">
Subgoal 1:

Variables: X E L1
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H2 : freshlist X (E :: L1)
============================
 fresh X E

Subgoal 2 is:
 fresh X E

member_fresh < <b>case H2.</b>
</pre>
<a name="11"></a>
<pre class="code">
Subgoal 1:

Variables: E3 E2
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
============================
 fresh n1 E2

Subgoal 2 is:
 fresh X E

member_fresh < <b>search.</b>
</pre>
<a name="12"></a>
<pre class="code">
Subgoal 2:

Variables: X E L1 B
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H2 : freshlist X (B :: L1)
H3 : member E L1 *
============================
 fresh X E

member_fresh < <b>assert freshlist X L1.</b>
</pre>
<a name="13"></a>
<pre class="code">
Subgoal 2.1:

Variables: X E L1 B
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H2 : freshlist X (B :: L1)
H3 : member E L1 *
============================
 freshlist X L1

Subgoal 2 is:
 fresh X E

member_fresh < <b>case H2.</b>
</pre>
<a name="14"></a>
<pre class="code">
Subgoal 2.1:

Variables: E E3 E2
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H3 : member (E n1) E3 *
============================
 freshlist n1 E3

Subgoal 2 is:
 fresh X E

member_fresh < <b>search.</b>
</pre>
<a name="15"></a>
<pre class="code">
Subgoal 2:

Variables: X E L1 B
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H2 : freshlist X (B :: L1)
H3 : member E L1 *
H4 : freshlist X L1
============================
 fresh X E

member_fresh < <b>apply IH to H3 H4.</b>
</pre>
<a name="16"></a>
<pre class="code">
Subgoal 2:

Variables: X E L1 B
IH : forall X L E, member E L * -> freshlist X L -> fresh X E
H2 : freshlist X (B :: L1)
H3 : member E L1 *
H4 : freshlist X L1
H5 : fresh X E
============================
 fresh X E

member_fresh < <b>search.</b>
Proof completed.
</pre>
<a name="17"></a>
<pre class="code">
Abella < <b>Define ctx : olist -> prop by 
ctx nil;
ctx (of X T :: L) := freshlist X L /\ ctx L.</b>

</pre>
<a name="18"></a>
<pre class="code">
Abella < <b>Theorem of_name : 
forall L E, ctx L -> member E L -> (exists X T, E = of X T /\ name X).</b>

</pre>
<a name="19"></a>
<pre class="code">

============================
 forall L E, ctx L -> member E L -> (exists X T, E = of X T /\ name X)

of_name < <b>induction on 1.</b>
</pre>
<a name="20"></a>
<pre class="code">

IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
============================
 forall L E, ctx L @ -> member E L -> (exists X T, E = of X T /\ name X)

of_name < <b>intros.</b>
</pre>
<a name="21"></a>
<pre class="code">

Variables: L E
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H1 : ctx L @
H2 : member E L
============================
 exists X T, E = of X T /\ name X

of_name < <b>case H1.</b>
</pre>
<a name="22"></a>
<pre class="code">
Subgoal 1:

Variables: E
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H2 : member E nil
============================
 exists X T, E = of X T /\ name X

Subgoal 2 is:
 exists X T, E = of X T /\ name X

of_name < <b>case H2.</b>
</pre>
<a name="23"></a>
<pre class="code">
Subgoal 2:

Variables: E L1 T X
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H2 : member E (of X T :: L1)
H3 : freshlist X L1
H4 : ctx L1 *
============================
 exists X T, E = of X T /\ name X

of_name < <b>case H3.</b>
</pre>
<a name="24"></a>
<pre class="code">
Subgoal 2:

Variables: E T E1
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H2 : member (E n1) (of n1 T :: E1)
H4 : ctx E1 *
============================
 exists X T, E n1 = of X T /\ name X

of_name < <b>case H2.</b>
</pre>
<a name="25"></a>
<pre class="code">
Subgoal 2.1:

Variables: T E1
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H4 : ctx E1 *
============================
 exists X T1, of n1 T = of X T1 /\ name X

Subgoal 2.2 is:
 exists X T, E n1 = of X T /\ name X

of_name < <b>search.</b>
</pre>
<a name="26"></a>
<pre class="code">
Subgoal 2.2:

Variables: E T E1
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H4 : ctx E1 *
H5 : member (E n1) E1
============================
 exists X T, E n1 = of X T /\ name X

of_name < <b>apply IH to H4 H5.</b>
</pre>
<a name="27"></a>
<pre class="code">
Subgoal 2.2:

Variables: T E1 X1 T1
IH : forall L E, ctx L * -> member E L -> (exists X T, E = of X T /\ name X)
H4 : ctx E1 *
H5 : member (of (X1 n1) T1) E1
H6 : name (X1 n1)
============================
 exists X T, of (X1 n1) T1 = of X T /\ name X

of_name < <b>search.</b>
Proof completed.
</pre>
<a name="28"></a>
<pre class="code">
Abella < <b>Theorem ctx_uniq : 
forall L E T1 T2, ctx L -> member (of E T1) L -> member (of E T2) L -> T1 =
  T2.</b>

</pre>
<a name="29"></a>
<pre class="code">

============================
 forall L E T1 T2, ctx L -> member (of E T1) L -> member (of E T2) L -> T1 =
   T2

ctx_uniq < <b>induction on 1.</b>
</pre>
<a name="30"></a>
<pre class="code">

IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
============================
 forall L E T1 T2, ctx L @ -> member (of E T1) L -> member (of E T2) L ->
   T1 = T2

ctx_uniq < <b>intros.</b>
</pre>
<a name="31"></a>
<pre class="code">

Variables: L E T1 T2
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H1 : ctx L @
H2 : member (of E T1) L
H3 : member (of E T2) L
============================
 T1 = T2

ctx_uniq < <b>case H1.</b>
</pre>
<a name="32"></a>
<pre class="code">
Subgoal 1:

Variables: E T1 T2
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H2 : member (of E T1) nil
H3 : member (of E T2) nil
============================
 T1 = T2

Subgoal 2 is:
 T1 = T2

ctx_uniq < <b>case H2.</b>
</pre>
<a name="33"></a>
<pre class="code">
Subgoal 2:

Variables: E T1 T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H2 : member (of E T1) (of X T :: L1)
H3 : member (of E T2) (of X T :: L1)
H4 : freshlist X L1
H5 : ctx L1 *
============================
 T1 = T2

ctx_uniq < <b>case H2.</b>
</pre>
<a name="34"></a>
<pre class="code">
Subgoal 2.1:

Variables: T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H3 : member (of X T2) (of X T :: L1)
H4 : freshlist X L1
H5 : ctx L1 *
============================
 T = T2

Subgoal 2.2 is:
 T1 = T2

ctx_uniq < <b>case H3.</b>
</pre>
<a name="35"></a>
<pre class="code">
Subgoal 2.1.1:

Variables: L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
============================
 T = T

Subgoal 2.1.2 is:
 T = T2

Subgoal 2.2 is:
 T1 = T2

ctx_uniq < <b>search.</b>
</pre>
<a name="36"></a>
<pre class="code">
Subgoal 2.1.2:

Variables: T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of X T2) L1
============================
 T = T2

Subgoal 2.2 is:
 T1 = T2

ctx_uniq < <b>apply member_fresh to H6 H4.</b>
</pre>
<a name="37"></a>
<pre class="code">
Subgoal 2.1.2:

Variables: T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of X T2) L1
H7 : fresh X (of X T2)
============================
 T = T2

Subgoal 2.2 is:
 T1 = T2

ctx_uniq < <b>case H7.</b>
</pre>
<a name="38"></a>
<pre class="code">
Subgoal 2.2:

Variables: E T1 T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H3 : member (of E T2) (of X T :: L1)
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of E T1) L1
============================
 T1 = T2

ctx_uniq < <b>case H3.</b>
</pre>
<a name="39"></a>
<pre class="code">
Subgoal 2.2.1:

Variables: T1 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of X T1) L1
============================
 T1 = T

Subgoal 2.2.2 is:
 T1 = T2

ctx_uniq < <b>apply member_fresh to H6 H4.</b>
</pre>
<a name="40"></a>
<pre class="code">
Subgoal 2.2.1:

Variables: T1 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of X T1) L1
H7 : fresh X (of X T1)
============================
 T1 = T

Subgoal 2.2.2 is:
 T1 = T2

ctx_uniq < <b>case H7.</b>
</pre>
<a name="41"></a>
<pre class="code">
Subgoal 2.2.2:

Variables: E T1 T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of E T1) L1
H7 : member (of E T2) L1
============================
 T1 = T2

ctx_uniq < <b>apply IH to H5 H6 H7.</b>
</pre>
<a name="42"></a>
<pre class="code">
Subgoal 2.2.2:

Variables: E T2 L1 T X
IH : forall L E T1 T2, ctx L * -> member (of E T1) L -> member (of E T2) L ->
       T1 = T2
H4 : freshlist X L1
H5 : ctx L1 *
H6 : member (of E T2) L1
H7 : member (of E T2) L1
============================
 T2 = T2

ctx_uniq < <b>search.</b>
Proof completed.
</pre>
<a name="43"></a>
<pre class="code">
Abella < <b>Theorem abs_arr : 
forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)} -> {L |- of N U} ->
  {L |- of (R N) T}.</b>

</pre>
<a name="44"></a>
<pre class="code">

============================
 forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)} -> {L |- of N U} ->
   {L |- of (R N) T}

abs_arr < <b>induction on 2.</b>
</pre>
<a name="45"></a>
<pre class="code">

IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
============================
 forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}@ -> {L |- of N U} ->
   {L |- of (R N) T}

abs_arr < <b>intros.</b>
</pre>
<a name="46"></a>
<pre class="code">

Variables: L R N U T
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H2 : {L |- of (abs R) (arr U T)}@
H3 : {L |- of N U}
============================
 {L |- of (R N) T}

abs_arr < <b>case H2.</b>
</pre>
<a name="47"></a>
<pre class="code">
Subgoal 1:

Variables: L R N U T
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L, of n1 U |- of (R n1) T}*
============================
 {L |- of (R N) T}

Subgoal 2 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b> inst H4 with n1 = N.</b>
</pre>
<a name="48"></a>
<pre class="code">
Subgoal 1:

Variables: L R N U T
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L, of n1 U |- of (R n1) T}*
H5 : {L, of N U |- of (R N) T}*
============================
 {L |- of (R N) T}

Subgoal 2 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>cut H5 with H3.</b>
</pre>
<a name="49"></a>
<pre class="code">
Subgoal 1:

Variables: L R N U T
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L, of n1 U |- of (R n1) T}*
H5 : {L, of N U |- of (R N) T}*
H6 : {L |- of (R N) T}
============================
 {L |- of (R N) T}

Subgoal 2 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>search.</b>
</pre>
<a name="50"></a>
<pre class="code">
Subgoal 2:

Variables: L R N U T U1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L |- inst (arr U T) U1}*
H5 : {L |- of (abs R) U1}*
============================
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>case H4.</b>
</pre>
<a name="51"></a>
<pre class="code">
Subgoal 2.1:

Variables: L R N U T T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T1 T)}*
H6 : {L |- inst U T1}*
============================
 {L |- of (R N) T}

Subgoal 2.2 is:
 {L |- of (R N) T}

Subgoal 2.3 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>assert {L |- of N T1}.</b>
</pre>
<a name="52"></a>
<pre class="code">
Subgoal 2.1:

Variables: L R N U T T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T1 T)}*
H6 : {L |- inst U T1}*
H7 : {L |- of N T1}
============================
 {L |- of (R N) T}

Subgoal 2.2 is:
 {L |- of (R N) T}

Subgoal 2.3 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply IH to _ H5 H7.</b>
</pre>
<a name="53"></a>
<pre class="code">
Subgoal 2.1:

Variables: L R N U T T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T1 T)}*
H6 : {L |- inst U T1}*
H7 : {L |- of N T1}
H8 : {L |- of (R N) T}
============================
 {L |- of (R N) T}

Subgoal 2.2 is:
 {L |- of (R N) T}

Subgoal 2.3 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>search.</b>
</pre>
<a name="54"></a>
<pre class="code">
Subgoal 2.2:

Variables: L R N U T U2
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr U U2)}*
H6 : {L |- inst T U2}*
============================
 {L |- of (R N) T}

Subgoal 2.3 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply IH to _ H5 H3.</b>
</pre>
<a name="55"></a>
<pre class="code">
Subgoal 2.2:

Variables: L R N U T U2
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr U U2)}*
H6 : {L |- inst T U2}*
H7 : {L |- of (R N) U2}
============================
 {L |- of (R N) T}

Subgoal 2.3 is:
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>search.</b>
</pre>
<a name="56"></a>
<pre class="code">
Subgoal 2.3:

Variables: L R N U T U1 F
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) U1}*
H6 : {L, [F] |- inst (arr U T) U1}*
H7 : member F L
============================
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply of_name to _ H7.</b>
</pre>
<a name="57"></a>
<pre class="code">
Subgoal 2.3:

Variables: L R N U T U1 X T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) U1}*
H6 : {L, [of X T1] |- inst (arr U T) U1}*
H7 : member (of X T1) L
H8 : name X
============================
 {L |- of (R N) T}

Subgoal 3 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>case H6.</b>
</pre>
<a name="58"></a>
<pre class="code">
Subgoal 3:

Variables: L R N U T T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L |- inst T1 (arr U T)}*
H5 : {L |- of (abs R) T1}*
============================
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>case H4.</b>
</pre>
<a name="59"></a>
<pre class="code">
Subgoal 3.1:

Variables: L R N U T T2 U1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (all T2)}*
H6 : T2 U1 = arr U T
============================
 {L |- of (R N) T}

Subgoal 3.2 is:
 {L |- of (R N) T}

Subgoal 3.3 is:
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>skip.</b>
</pre>
<a name="60"></a>
<pre class="code">
Subgoal 3.2:

Variables: L R N U T T3
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T3 T)}*
H6 : {L |- inst T3 U}*
============================
 {L |- of (R N) T}

Subgoal 3.3 is:
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>assert {L |- of N T3}.</b>
</pre>
<a name="61"></a>
<pre class="code">
Subgoal 3.2:

Variables: L R N U T T3
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T3 T)}*
H6 : {L |- inst T3 U}*
H7 : {L |- of N T3}
============================
 {L |- of (R N) T}

Subgoal 3.3 is:
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply IH to _ H5 H7.</b>
</pre>
<a name="62"></a>
<pre class="code">
Subgoal 3.2:

Variables: L R N U T T3
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr T3 T)}*
H6 : {L |- inst T3 U}*
H7 : {L |- of N T3}
H8 : {L |- of (R N) T}
============================
 {L |- of (R N) T}

Subgoal 3.3 is:
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>search.</b>
</pre>
<a name="63"></a>
<pre class="code">
Subgoal 3.3:

Variables: L R N U T U2
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr U U2)}*
H6 : {L |- inst U2 T}*
============================
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply IH to _ H5 _.</b>
</pre>
<a name="64"></a>
<pre class="code">
Subgoal 3.3:

Variables: L R N U T U2
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) (arr U U2)}*
H6 : {L |- inst U2 T}*
H7 : {L |- of (R N) U2}
============================
 {L |- of (R N) T}

Subgoal 3.4 is:
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>search.</b>
</pre>
<a name="65"></a>
<pre class="code">
Subgoal 3.4:

Variables: L R N U T T1 F
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) T1}*
H6 : {L, [F] |- inst T1 (arr U T)}*
H7 : member F L
============================
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>apply of_name to _ H7.</b>
</pre>
<a name="66"></a>
<pre class="code">
Subgoal 3.4:

Variables: L R N U T T1 X T2
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H5 : {L |- of (abs R) T1}*
H6 : {L, [of X T2] |- inst T1 (arr U T)}*
H7 : member (of X T2) L
H8 : name X
============================
 {L |- of (R N) T}

Subgoal 4 is:
 {L |- of (R N) T}

abs_arr < <b>case H6.</b>
</pre>
<a name="67"></a>
<pre class="code">
Subgoal 4:

Variables: L R N U T F
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L, [F] |- of (abs R) (arr U T)}*
H5 : member F L
============================
 {L |- of (R N) T}

abs_arr < <b>apply of_name to _ H5.</b>
</pre>
<a name="68"></a>
<pre class="code">
Subgoal 4:

Variables: L R N U T X T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx L
H3 : {L |- of N U}
H4 : {L, [of X T1] |- of (abs R) (arr U T)}*
H5 : member (of X T1) L
H6 : name X
============================
 {L |- of (R N) T}

abs_arr < <b>case H6.</b>
</pre>
<a name="69"></a>
<pre class="code">
Subgoal 4:

Variables: L R N U T T1
IH : forall L R N U T, ctx L -> {L |- of (abs R) (arr U T)}* ->
       {L |- of N U} -> {L |- of (R N) T}
H1 : ctx (L n1)
H3 : {L n1 |- of (N n1) U}
H4 : {L n1, [of n1 T1] |- of (abs (R n1)) (arr U T)}*
H5 : member (of n1 T1) (L n1)
============================
 {L n1 |- of (R n1 (N n1)) T}

abs_arr < <b>case H4.</b>
Proof completed.
</pre>
<a name="70"></a>
<pre class="code">
Abella < <b>Theorem step_preserves_of : 
forall L M N T, ctx L -> {L |- of M T} -> {step M N} -> {L |- of N T}.</b>

</pre>
<a name="71"></a>
<pre class="code">

============================
 forall L M N T, ctx L -> {L |- of M T} -> {step M N} -> {L |- of N T}

step_preserves_of < <b>induction on 2.</b>
</pre>
<a name="72"></a>
<pre class="code">

IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
============================
 forall L M N T, ctx L -> {L |- of M T}@ -> {step M N} -> {L |- of N T}

step_preserves_of < <b>intros.</b>
</pre>
<a name="73"></a>
<pre class="code">

Variables: L M N T
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H2 : {L |- of M T}@
H3 : {step M N}
============================
 {L |- of N T}

step_preserves_of < <b>case H2.</b>
</pre>
<a name="74"></a>
<pre class="code">
Subgoal 1:

Variables: L N T U N1 M1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step (app M1 N1) N}
H4 : {L |- of M1 (arr U T)}*
H5 : {L |- of N1 U}*
============================
 {L |- of N T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>case H3.</b>
</pre>
<a name="75"></a>
<pre class="code">
Subgoal 1.1:

Variables: L T U N1 M1 M'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of M1 (arr U T)}*
H5 : {L |- of N1 U}*
H6 : {step M1 M'}
============================
 {L |- of (app M' N1) T}

Subgoal 1.2 is:
 {L |- of (app M1 N') T}

Subgoal 1.3 is:
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply IH to _ H4 H6.</b>
</pre>
<a name="76"></a>
<pre class="code">
Subgoal 1.1:

Variables: L T U N1 M1 M'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of M1 (arr U T)}*
H5 : {L |- of N1 U}*
H6 : {step M1 M'}
H7 : {L |- of M' (arr U T)}
============================
 {L |- of (app M' N1) T}

Subgoal 1.2 is:
 {L |- of (app M1 N') T}

Subgoal 1.3 is:
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="77"></a>
<pre class="code">
Subgoal 1.2:

Variables: L T U N1 M1 N'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of M1 (arr U T)}*
H5 : {L |- of N1 U}*
H6 : {step N1 N'}
============================
 {L |- of (app M1 N') T}

Subgoal 1.3 is:
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply IH to _ H5 H6.</b>
</pre>
<a name="78"></a>
<pre class="code">
Subgoal 1.2:

Variables: L T U N1 M1 N'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of M1 (arr U T)}*
H5 : {L |- of N1 U}*
H6 : {step N1 N'}
H7 : {L |- of N' U}
============================
 {L |- of (app M1 N') T}

Subgoal 1.3 is:
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="79"></a>
<pre class="code">
Subgoal 1.3:

Variables: L T U N1 R
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of (abs R) (arr U T)}*
H5 : {L |- of N1 U}*
============================
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply abs_arr to _ H4 H5.</b>
</pre>
<a name="80"></a>
<pre class="code">
Subgoal 1.3:

Variables: L T U N1 R
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L |- of (abs R) (arr U T)}*
H5 : {L |- of N1 U}*
H6 : {L |- of (R N1) T}
============================
 {L |- of (R N1) T}

Subgoal 2 is:
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="81"></a>
<pre class="code">
Subgoal 2:

Variables: L N U R T1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step (abs R) N}
H4 : {L, of n1 T1 |- of (R n1) U}*
============================
 {L |- of N (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>case H3.</b>
</pre>
<a name="82"></a>
<pre class="code">
Subgoal 2:

Variables: L U R T1 R'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L, of n1 T1 |- of (R n1) U}*
H5 : {step (R n1) (R' n1)}
============================
 {L |- of (abs R') (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply IH to _ H4 H5.</b>
</pre>
<a name="83"></a>
<pre class="code">
Subgoal 2:

Variables: L U R T1 R'
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H4 : {L, of n1 T1 |- of (R n1) U}*
H5 : {step (R n1) (R' n1)}
H6 : {L, of n1 T1 |- of (R' n1) U}
============================
 {L |- of (abs R') (arr T1 U)}

Subgoal 3 is:
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="84"></a>
<pre class="code">
Subgoal 3:

Variables: L M N T U
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L |- inst T U}*
H5 : {L |- of M U}*
============================
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply IH to _ H5 H3.</b>
</pre>
<a name="85"></a>
<pre class="code">
Subgoal 3:

Variables: L M N T U
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L |- inst T U}*
H5 : {L |- of M U}*
H6 : {L |- of N U}
============================
 {L |- of N T}

Subgoal 4 is:
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="86"></a>
<pre class="code">
Subgoal 4:

Variables: L M N T T1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L |- inst T1 T}*
H5 : {L |- of M T1}*
============================
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>apply IH to _ H5 H3.</b>
</pre>
<a name="87"></a>
<pre class="code">
Subgoal 4:

Variables: L M N T T1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L |- inst T1 T}*
H5 : {L |- of M T1}*
H6 : {L |- of N T1}
============================
 {L |- of N T}

Subgoal 5 is:
 {L |- of N T}

step_preserves_of < <b>search.</b>
</pre>
<a name="88"></a>
<pre class="code">
Subgoal 5:

Variables: L M N T F
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L, [F] |- of M T}*
H5 : member F L
============================
 {L |- of N T}

step_preserves_of < <b>apply of_name to _ H5.</b>
</pre>
<a name="89"></a>
<pre class="code">
Subgoal 5:

Variables: L M N T X T1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H4 : {L, [of X T1] |- of M T}*
H5 : member (of X T1) L
H6 : name X
============================
 {L |- of N T}

step_preserves_of < <b>case H4.</b>
</pre>
<a name="90"></a>
<pre class="code">
Subgoal 5:

Variables: L M N T
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H3 : {step M N}
H5 : member (of M T) L
H6 : name M
============================
 {L |- of N T}

step_preserves_of < <b>case H3.</b>
</pre>
<a name="91"></a>
<pre class="code">
Subgoal 5.1:

Variables: L T M' M1 N1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H5 : member (of (app M1 N1) T) L
H6 : name (app M1 N1)
H7 : {step M1 M'}
============================
 {L |- of (app M' N1) T}

Subgoal 5.2 is:
 {L |- of (app M1 N') T}

Subgoal 5.3 is:
 {L |- of (abs R') T}

Subgoal 5.4 is:
 {L |- of (R N1) T}

step_preserves_of < <b>case H6.</b>
</pre>
<a name="92"></a>
<pre class="code">
Subgoal 5.2:

Variables: L T N' N1 M1
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H5 : member (of (app M1 N1) T) L
H6 : name (app M1 N1)
H7 : {step N1 N'}
============================
 {L |- of (app M1 N') T}

Subgoal 5.3 is:
 {L |- of (abs R') T}

Subgoal 5.4 is:
 {L |- of (R N1) T}

step_preserves_of < <b>case H6.</b>
</pre>
<a name="93"></a>
<pre class="code">
Subgoal 5.3:

Variables: L T R' R
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H5 : member (of (abs R) T) L
H6 : name (abs R)
H7 : {step (R n1) (R' n1)}
============================
 {L |- of (abs R') T}

Subgoal 5.4 is:
 {L |- of (R N1) T}

step_preserves_of < <b>case H6.</b>
</pre>
<a name="94"></a>
<pre class="code">
Subgoal 5.4:

Variables: L T N1 R
IH : forall L M N T, ctx L -> {L |- of M T}* -> {step M N} -> {L |- of N T}
H1 : ctx L
H5 : member (of (app (abs R) N1) T) L
H6 : name (app (abs R) N1)
============================
 {L |- of (R N1) T}

step_preserves_of < <b>case H6.</b>
Proof completed.
</pre>
<a name="95"></a>
<pre class="code">
Abella < 
</pre>
