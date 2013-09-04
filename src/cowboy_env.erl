-module(cowboy_env).

-export([execute/2]).
-export([get/1]).

execute(Req, Env) ->
  {Environment, Req2} = cowboy_req:header(<<"x-env">>, Req, <<"prod">>),
  Req3 = cowboy_req:set_meta(cowboy_env, Environment, Req2),
  {ok, Req3, Env}.

get(Req) ->
  {Env, _} = cowboy_req:meta(cowboy_env, Req),
  Env.
