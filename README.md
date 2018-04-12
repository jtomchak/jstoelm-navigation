# jstoelm-navigation

1.  `elm-package install elm-lang/navigation -y`

2.  `import Navigation` Update the program to be a navigation program that will take the inital and `UrlChange` which is a type of Msg

3.  This means that our init will need to be updated. For now let's give it a hard coded url

```elm
init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { route = Home }, Cmd.none )
```
