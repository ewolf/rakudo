# XXX This file is very much a work in progress, steadily updating it from the
# Parrot original to work for JVM.

my $ops := nqp::getcomp('QAST').operations;

# Type containing Perl 6 specific ops.
my $TYPE_P6OPS := 'Lorg/perl6/rakudo/Ops;';

# Opcode types.
my $RT_OBJ  := 0;
my $RT_INT  := 1;
my $RT_NUM  := 2;
my $RT_STR  := 3;

# Perl 6 opcode specific mappings.
$ops.map_classlib_hll_op('perl6', 'p6box_i', $TYPE_P6OPS, 'p6box_i', [$RT_INT], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6box_n', $TYPE_P6OPS, 'p6box_n', [$RT_NUM], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6box_s', $TYPE_P6OPS, 'p6box_s', [$RT_STR], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6bigint', $TYPE_P6OPS, 'p6bigint', [$RT_NUM], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6parcel', $TYPE_P6OPS, 'p6parcel', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6listiter', $TYPE_P6OPS, 'p6listiter', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6list', $TYPE_P6OPS, 'p6list', [$RT_OBJ, $RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6listitems', $TYPE_P6OPS, 'p6listitems', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6decont', $TYPE_P6OPS, 'decont', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6recont_ro', $TYPE_P6OPS, 'p6recont_ro', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6store', $TYPE_P6OPS, 'p6store', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6takedisp', $TYPE_P6OPS, 'p6takedisp', [], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6var', $TYPE_P6OPS, 'p6var', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6reprname', $TYPE_P6OPS, 'p6reprname', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6definite', $TYPE_P6OPS, 'p6definite', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6bindsig', $TYPE_P6OPS, 'p6bindsig', [], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6isbindable', $TYPE_P6OPS, 'p6isbindable', [$RT_OBJ, $RT_OBJ], $RT_INT, :tc);
$ops.map_classlib_hll_op('perl6', 'p6bindcaptosig', $TYPE_P6OPS, 'p6bindcaptosig', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6trialbind', $TYPE_P6OPS, 'p6trialbind', [$RT_OBJ, $RT_OBJ, $RT_OBJ], $RT_INT, :tc);
$ops.map_classlib_hll_op('perl6', 'p6typecheckrv', $TYPE_P6OPS, 'p6typecheckrv', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6decontrv', $TYPE_P6OPS, 'p6decontrv', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6capturelex', $TYPE_P6OPS, 'p6capturelex', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6bindassert', $TYPE_P6OPS, 'p6bindassert', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6getpackage', $TYPE_P6OPS, 'p6getpackage', [$RT_OBJ, $RT_STR], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6stateinit', $TYPE_P6OPS, 'p6stateinit', [], $RT_INT, :tc);
$ops.map_classlib_hll_op('perl6', 'p6setpre', $TYPE_P6OPS, 'p6setpre', [], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6clearpre', $TYPE_P6OPS, 'p6clearpre', [], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6setfirstflag', $TYPE_P6OPS, 'p6setfirstflag', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6takefirstflag', $TYPE_P6OPS, 'p6takefirstflag', [], $RT_INT, :tc);
$ops.map_classlib_hll_op('perl6', 'p6return', $TYPE_P6OPS, 'p6return', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6routinereturn', $TYPE_P6OPS, 'p6routinereturn', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'p6getouterctx', $TYPE_P6OPS, 'p6getouterctx', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('perl6', 'tclc', $TYPE_P6OPS, 'tclc', [$RT_STR], $RT_STR, :tc);
#$ops.add_hll_op('perl6', 'p6getcallsig', -> $qastcomp, $op {
#    my $reg := $*REGALLOC.fresh_p();
#    my $ops := $qastcomp.post_new('Ops', :result($reg));
#    $ops.push_pirop('set', $reg, 'CALL_SIG');
#    $ops
#});
#my $p6bool := -> $qastcomp, $op {
#    my $cpost := $qastcomp.as_post($op[0]);
#    my $reg := $*REGALLOC.fresh_p();
#    my $ops := $qastcomp.post_new('Ops', :result($reg));
#    $ops.push($cpost);
#    if nqp::lc($qastcomp.infer_type($cpost.result)) eq 'i' {
#        $ops.push_pirop('perl6_booleanize', $reg, $cpost);
#    }
#    else {
#        my $reg_i := $*REGALLOC.fresh_i();
#        $ops.push_pirop('istrue', $reg_i, $cpost);
#        $ops.push_pirop('perl6_booleanize', $reg, $reg_i);
#    }
#    $ops
#}
#$ops.add_hll_op('perl6', 'p6bool', $p6bool);

# Make some of them also available from NQP land, since we use them in the
# metamodel and bootstrap.
#$ops.add_hll_op('nqp', 'p6bool', $p6bool);
$ops.map_classlib_hll_op('nqp', 'p6var', $TYPE_P6OPS, 'p6var', [$RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('nqp', 'p6parcel', $TYPE_P6OPS, 'p6parcel', [$RT_OBJ, $RT_OBJ], $RT_OBJ, :tc);
$ops.map_classlib_hll_op('nqp', 'p6isbindable', $TYPE_P6OPS, 'p6isbindable', [$RT_OBJ, $RT_OBJ], $RT_INT, :tc);
$ops.map_classlib_hll_op('nqp', 'p6trialbind', $TYPE_P6OPS, 'p6trialbind', [$RT_OBJ, $RT_OBJ, $RT_OBJ], $RT_INT, :tc);

## Override defor to avoid v-table call.
#$ops.add_hll_op('perl6', 'defor', -> $qastcomp, $op {
#    if +$op.list != 2 {
#        nqp::die("Operation 'defor' needs 2 operands");
#    }
#    my $ops := PIRT::Ops.new();
#    my $lbl := PIRT::Label.new(:name('defor'));
#    my $dreg := $*REGALLOC.fresh_p();
#    my $rreg := $*REGALLOC.fresh_p();
#    my $test := $qastcomp.coerce($qastcomp.as_post($op[0]), 'P');
#    my $then := $qastcomp.coerce($qastcomp.as_post($op[1]), 'P');
#    $ops.push($test);
#    $ops.push_pirop('set', $rreg, $test);
#    $ops.push_pirop('callmethod', "'defined'", $rreg, :result($dreg));
#    $ops.push_pirop('if', $dreg, $lbl);
#    $ops.push($then);
#    $ops.push_pirop('set', $rreg, $then);
#    $ops.push($lbl);
#    $ops.result($rreg);
#    $ops
#});
#
## Boxing and unboxing configuration.
#$ops.add_hll_box('perl6', 'i', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_p();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('perl6_box_int', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.add_hll_box('perl6', 'n', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_p();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('perl6_box_num', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.add_hll_box('perl6', 's', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_p();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('perl6_box_str', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.add_hll_unbox('perl6', 'i', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_i();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('repr_unbox_int', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.add_hll_unbox('perl6', 'n', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_n();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('set', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.add_hll_unbox('perl6', 's', -> $qastcomp, $post {
#    my $reg := $*REGALLOC.fresh_s();
#    my $ops := $qastcomp.post_new('Ops');
#    $ops.push($post);
#    $ops.push_pirop('set', $reg, $post);
#    $ops.result($reg);
#    $ops
#});
#$ops.force_return_boxing_for_hll('perl6');