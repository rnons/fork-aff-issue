{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
	"my-project"
, dependencies =
	[ "effect"
	, "console"
	, "psci-support"
	, "aff"
	, "debug"
	, "node-child-process"
	]
, packages =
	./packages.dhall
, sources =
	[ "src/**/*.purs", "test/**/*.purs" ]
}