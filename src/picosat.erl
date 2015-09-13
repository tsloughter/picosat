-module(picosat).

%% API exports
-export([solve/1]).

%%====================================================================
%% API functions
%%====================================================================

solve(Ints) ->
    picosat_nif:solve(Ints).
