module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Model =
    { logoSize : Float
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { logoSize = 10.0 }, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = GoToHi


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoToHi ->
            ( model, Nav.load "#hi" )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Browser.Document Msg
view model =
    let
        { logoSize } =
            model
    in
    { title = "Elm 0.19 starter"
    , body =
        [ button [ onClick GoToHi ] [ text "go to Hi" ]
        , div [ class "box" ] []
        , h1 [ id "hi" ] [ text "Hi" ]
        , div [ class "box" ] []
        ]
    }



-- ---------------------------
-- MAIN
-- ---------------------------


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
