module Main exposing (..)

import Navigation
import Html exposing (Html, text, div, h1, img, li, ul, a)
import Html.Attributes exposing (src, href)


---- MODEL ----


type Route
    = Home
    | About
    | Contact


type alias Model =
    { route : Route }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { route = Home }, Cmd.none )



---- UPDATE ----


type Msg
    = UrlChange Navigation.Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            case location.hash of
                "#home" ->
                    { model | route = Home } ! [ Cmd.none ]

                "#about" ->
                    { model | route = About } ! [ Cmd.none ]

                "#contact" ->
                    { model | route = Contact } ! [ Cmd.none ]

                _ ->
                    { model | route = Home } ! [ Cmd.none ]



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ menu
        , content model
        ]


viewLinks : String -> Html Msg
viewLinks name =
    li [] [ a [ href ("#" ++ name) ] [ text name ] ]


menu : Html Msg
menu =
    ul [] (List.map viewLinks [ "home", "about", "contact", "Bob" ])


content : Model -> Html Msg
content model =
    case model.route of
        Home ->
            h1 [] [ text "Home Page" ]

        About ->
            h1 [] [ text "About Page" ]

        Contact ->
            h1 [] [ text "Contact Page" ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
