{ name = "my-project"
, dependencies =
    [ "console"
    , "control"
    , "effect"
    , "lists"
    , "prelude"
    , "test-unit"
    , "maybe"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
