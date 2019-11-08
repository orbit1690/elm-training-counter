module Counter exposing (Model, Msg, init, update, view)

import Browser
import Html exposing (button, div, h2, input, strong, text)
import Html.Attributes as Attributes
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { counter : Float
    , content : String
    , lastCounter : Float
    }


init : Model
init =
    { counter = 0, content = "0", lastCounter = 0 }


type Msg
    = Plus
    | Minus
    | Multiply
    | Div
    | ChangeNumber String
    | ResetCounter
    | Undo


update : Msg -> Model -> Model
update msg model =
    let
        userInputNum : Float
        userInputNum =
            Maybe.withDefault 0 (String.toFloat model.content)
    in
    case msg of
        Plus ->
            { model
                | counter = model.counter + userInputNum
                , lastCounter = model.counter
            }

        Minus ->
            { model
                | counter = model.counter - userInputNum
                , lastCounter = model.counter
            }

        Multiply ->
            { model
                | counter = model.counter * userInputNum
                , lastCounter = model.counter
            }

        Div ->
            { model
                | counter = model.counter / userInputNum
                , lastCounter = model.counter
            }

        ChangeNumber newNumber ->
            { model | content = newNumber }

        ResetCounter ->
            { model
                | counter = 0
                , lastCounter = model.counter
            }

        Undo ->
            { model
                | counter = model.lastCounter
                , lastCounter = model.counter
            }


view : Model -> Html.Html Msg
view model =
    div []
        [ h2 [] [ text <| String.fromFloat model.counter ]
        , div [] [ input [ onInput ChangeNumber ] [] ]
        , button [ onClick Plus ] [ text "+" ]
        , button [ onClick Minus ] [ text "-" ]
        , button [ onClick Multiply ] [ text "*" ]
        , button [ onClick Div ] [ text "/" ]
        , button [ onClick ResetCounter ] [ text "Reset counter" ]
        , button [ onClick Undo ] [ text "Undo" ]
        ]
