module Main exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)



-- https://redpanthers.co/integrating-elm-rails/
-- MODEL


type alias Model =
    { hl : Highlight }


type Highlight
    = Neither
    | First
    | Second



-- INIT


init : ( Model, Cmd Message )
init =
    ( { hl = Neither }, Cmd.none )



-- VIEW


firstColor model =
    case model.hl of
        First ->
            "ff4422"

        Second ->
            "888888"

        Neither ->
            "444444"


secondColor model =
    case model.hl of
        First ->
            "888888"

        Second ->
            "22ff44"

        Neither ->
            "444444"


view : Model -> Html Message
view model =
    -- The inline style is being used for example purposes in order to keep this example simple and
    -- avoid loading additional resources. Use a proper stylesheet when building your own app.
    div []
        [ p [] [ text "play with clicking on the heading" ]
        , h1 []
            [ span
                [ css [ color (hex (firstColor model)) ]
                , onClick HighlightFirst
                ]
                [ text "Hello" ]
            , span [ onClick HighlightNeither ] [ text " - " ]
            , span
                [ css [ color (hex (secondColor model)) ]
                , onClick HighlightSecond
                ]
                [ text "Elmisko!" ]
            ]
        , p [] [ text (Debug.toString model) ]
        ]



-- MESSAGE


type Message
    = None
    | HighlightFirst
    | HighlightSecond
    | HighlightNeither



-- UPDATE


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        None ->
            ( model, Cmd.none )

        HighlightFirst ->
            ( { model | hl = First }, Cmd.none )

        HighlightSecond ->
            ( { model | hl = Second }, Cmd.none )

        HighlightNeither ->
            ( { model | hl = Neither }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.none



-- MAIN


main : Program (Maybe {}) Model Message
main =
    Browser.element
        { init = always init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }
