-module(web_samples_postbackextra).
-include("element_interface.inc").
-include("wf.inc").
-compile(export_all).
main() -> 
	#template { file="./wwwroot/onecolumn.html", bindings=[
		{'Group', learn},
		{'Item', samples}
	]}.

title() -> "Custom Postbacks".  headline() -> "Custom Postbacks".
right() -> linecount:render().

body() -> [
	"<button onclick=\"test('abc','abcd')\">Test</button>",
	#interface{
		functions=[#fType{name="test",params=["a1","a2"]}],
		parentModule=?MODULE
	},
	"<div id=\"test_out\"/>",
	#hidden{id="me"}
].
event(test) ->
	wf:wire("$('#test_out').html(\"received params " ++ wf:q('a1') ++ wf:q('a2') ++ "\");");
event(EventInfo) ->
	wf:wire(#alert { text=wf:f("~p", [EventInfo]) }),
	ok.
