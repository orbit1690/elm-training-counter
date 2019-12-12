module Counter exposing (update)

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
        [ createButton Minus "-"
        , createButton Plus "+"
        , createButton Mul "*"
        , createButton Divide "/"
        , Html.text <| String.fromFloat model
        ]


createButton : Msg -> String -> Html.Html Msg
createButton msg operation =
    Html.button [ onClick msg ] [ Html.text operation ]
