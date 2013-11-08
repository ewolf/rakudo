# Schedulers do this role. It mostly serves as an interface for the things
# that schedulers must do, as well as a way to factor out some common "sugar"
# and infrastructure.

my role Scheduler {
    has &.uncaught_handler is rw;

    method handle_uncaught($exception) {
        my $ch = &!uncaught_handler;
        if $ch {
            $ch($exception);
        }
        else {
            # No default handler, so terminate the application.
            note "Unhandled exception in code scheduled on thread " ~ $*THREAD.id;
            note $exception.gist;
            exit(1);
        }
    }

    proto method cue(|) { * }
    multi method cue(&code) { ... }
    multi method cue(&code, :$in!) { ... }
    multi method cue(&code, :$every!, :$in = 0) { ... }
    multi method cue(&code, :$at!, :$every, :$in) { ... }

    method cue_with_catch(&code, &catch) {
        self.cue({
            code();
            CATCH { default { catch($_) } }
        })
    }
    
    method outstanding() { ... }
}