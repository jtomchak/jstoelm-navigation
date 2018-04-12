# jstoelm-navigation

1.  `elm-package install elm-lang/navigation -y` we'll start with a #hash routing system for simplicity and then grow it from there.

2.  `import Navigation` Update the program to be a navigation program that will take the inital and `UrlChange` which is a type of Msg

```elm
main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
```

3.  This means that our init will need to be updated. For now let's give it a hard coded url

```elm
init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { route = Home }, Cmd.none )
```

4.  So now we need a type on our Msg UrlChange in our update function. This will be where we want to match on the location.hash. And update the model.route value based on that. with of course default, meaning no match, to Home.

```elm
case msg of
        UrlChange location ->
            case location.hash of
```

5.
