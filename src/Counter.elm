module Main exposing (update)

import Browser
import Html
import Html.Attributes as Attributes
import Html.Events as Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    Float


type Msg
    = Plus
    | Minus
    | Mul
    | Divide


init : Model
init =
    0


update : Msg -> Model -> Model
update msg model =
    case msg of
        Plus ->
            model + 1

        Minus ->
            model - 1

        Mul ->
            model * 2

        Divide ->
            model / 2


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.button [ onClick Minus ] [ Html.text "-" ]
        , Html.button [ onClick Plus ] [ Html.text "+" ]
        , Html.button [ onClick Mul ] [ Html.text "*" ]
        , Html.button [ onClick Divide ] [ Html.text "/" ]
        , Html.text <| String.fromFloat model
        ]
