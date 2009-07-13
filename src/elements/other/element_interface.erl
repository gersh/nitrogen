% Written By Gershon Bialer
% Creates a javascript element with callbacks to erlang events
-module(element_interface).
-include("wf.inc").
-include("element_interface.inc").
-compile(export_all).
%%
% getFunctionCall/1
%%
getFunctionCall([P|Params]) ->
	if length(Params)>0 ->
		["'",P,"':",P,",",getFunctionCall(Params)];
	length(Params)==0 ->
		["'",P,"':",P]
	end.
getParamsCall([P|Params]) ->
	if length(Params)>0 ->
		[P,",",getParamsCall(Params)];
	   length(Params)==0 ->
		[P]
	end.
%%
% getPostbackFunctions/3
%%
getPostbackFunctions(_ControlId,[],Functions,_Module) ->
	Functions;
getPostbackFunctions(ControlId,[F|FNames],Functions,Module) ->
	Function=["function ",F#fType.name,"(",getParamsCall(F#fType.params),") {",action_event:make_postback(list_to_atom(F#fType.name),click,list_to_atom(ControlId),list_to_atom(ControlId),Module,["jQuery.param({",getFunctionCall(F#fType.params),"})"]),";}"],
	getPostbackFunctions(ControlId,FNames,[Function|Functions],Module).
getPostbackFunctions(ControlId,FNames,Module) ->
	getPostbackFunctions(ControlId,FNames,[],Module).
%%
% render/2
%%
render(ControlID,Record) ->
	Form=[
		#hidden{id=ControlID},
		"<script type=\"text/javascript\">",
		getPostbackFunctions(ControlID,Record#interface.functions,Record#interface.parentModule),
		"</script>"],
	wf:render(Form).
