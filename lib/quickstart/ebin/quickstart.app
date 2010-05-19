{application, quickstart, [
	{description,  "Nitrogen Quickstart"},
	{vsn, "2.0"},
        {modules, [
           common,
           community,
           demos,
           downloads,
           index,
           learn,
           nitrogen_init,
           quickstart_app,
           whatsnew,
           demos_advancedcontrols1,
           demos_advancedcontrols2,
           demos_ajax,
           demos_api,
           demos_binding1,
           demos_binding2,
           demos_binding3,
           demos_binding4,
           demos_comet1,
           demos_comet2,
           demos_comet3,
           demos_contenttype,
           demos_contenttype_image,
           demos_continuations,
           demos_dragdrop,
           demos_effects,
           demos_headers,
           demos_jquerypaths,
           demos_notices,
           demos_postback,
           demos_proxied,
           demos_radio,
           demos_remove,
           demos_replace,
           demos_security,
           demos_security_login,
           demos_security_restricted,
           demos_simplecontrols,
	   demos_state,
           demos_sorting1,
           demos_sorting2,
           demos_upload,
           demos_validation,
           demos_viewsource,
           linecount
        ]},
        {registered,[quickstart_app]},
	{applications, [nitrogen]},
	{mod, {quickstart_app, []}}
]}.