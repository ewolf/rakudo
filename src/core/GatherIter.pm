class GatherIter is Iterator {
    has Mu $!coro;             # coroutine to execute for more pairs
    has $!reified;             # Parcel of this iterator's results
    has $!infinite;            # true if iterator is known infinite

#?if !parrot
    my $GATHER_PROMPT = Mu.new;
    my $SENTINEL := Mu.new;
#?endif
    method new($block, Mu :$infinite) {
#?if parrot
        my Mu $coro :=
            nqp::clone(nqp::getattr(&coro, Code, '$!do'));
        nqp::ifnull($coro($block), Nil);
#?endif
#?if !parrot
        my Mu $takings;
        my Mu $state;
        my &yield := {
            nqp::continuationcontrol(0, $GATHER_PROMPT, -> Mu \c { $state := c; });
        }
        $state := {
            nqp::handle( $block(),
                'TAKE', SEQ($takings := nqp::getpayload(nqp::exception()); yield(); nqp::resume(nqp::exception())));
            $takings := $SENTINEL; yield();
        };
        my $coro := { nqp::continuationreset($GATHER_PROMPT, $state); $takings };
#?endif
        my Mu $new := nqp::create(self);
        nqp::bindattr($new, GatherIter, '$!coro', $coro);
        nqp::bindattr($new, GatherIter, '$!infinite', $infinite);
        $new;
    }

    multi method DUMP(GatherIter:D: :$indent-step = 4, :%ctx?) {
        return DUMP(self, :$indent-step) unless %ctx;

        my $flags    := ("\x221e" if self.infinite);
        my Mu $attrs := nqp::list();
        nqp::push($attrs, '$!reified' );
        nqp::push($attrs,  $!reified  );
        nqp::push($attrs, '$!coro'    );
        nqp::push($attrs,  $!coro     );
        self.DUMP-OBJECT-ATTRS($attrs, :$indent-step, :%ctx, :$flags);
    }

    method reify($n) {
        if !$!reified.defined {
            my Mu $rpa := nqp::list();
            my Mu $parcel;
            my int $end;
            my int $count =
              nqp::unbox_i(nqp::istype($n,Whatever) ?? 1000 !! $n);
            while nqp::not_i($end) && nqp::isgt_i($count,0) {
                $parcel := $!coro();
#?if parrot
                $end = nqp::isnull($parcel);
#?endif
#?if !parrot
                $end = nqp::eqaddr($parcel, $SENTINEL);
#?endif
                nqp::push($rpa, $parcel) if nqp::not_i($end);
                $count = $count - 1;
            }
            nqp::push($rpa,
                nqp::p6bindattrinvres(
                    nqp::p6bindattrinvres(
                        nqp::create(self), GatherIter, '$!coro', $!coro),
                    GatherIter, '$!infinite', $!infinite))
                if nqp::not_i($end);
            $!reified := nqp::p6parcel($rpa, nqp::null());
        }
        $!reified
    }

    multi method infinite(GatherIter:D:) { $!infinite }

#?if parrot
    my sub coro(\block) {
        Q:PIR {
            .local pmc block, handler, taken
            block = find_lex 'block'
            .yield ()
            handler = root_new ['parrot';'ExceptionHandler']
            handler.'handle_types'(.CONTROL_TAKE)
            set_addr handler, take_handler
            push_eh handler
            $P0 = block()
            $P0.'eager'()
            pop_eh
          gather_done:
            null taken
            .yield (taken)
            goto gather_done
          take_handler:
            .local pmc exception, resume
            .get_results (exception)
            taken  = exception['payload']
            resume = exception['resume']
            .yield (taken)
            resume()
            goto gather_done    # should never get here
        };
        True
    }
#?endif
}


sub GATHER(\block, Mu :$infinite) {
    GatherIter.new( block, :$infinite ).list;
}

# vim: ft=perl6 expandtab sw=4
