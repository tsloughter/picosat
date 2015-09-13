-module(picosat_nif).

%% API exports
-export([solve/1]).

-on_load(init/0).

%%====================================================================
%% API functions
%%====================================================================

init() ->
    PrivDir = code:priv_dir(picosat),
    ok = erlang:load_nif(filename:join(PrivDir, "picosat_nif"), 0).

solve(_Ints) ->
  exit(nif_library_not_loaded).
