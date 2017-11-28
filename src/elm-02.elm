import Html exposing (Html, Attribute, div, button, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = Html.beginnerProgram {model=model, update=update, view=view}

type alias Model = {content: String}
type Msg = Change String

model : Model
model = {content=""}

update: Msg -> Model -> Model
update msg model = 
    case msg of
        Change newContent -> 
            {model | content = newContent}
    

view : Model -> Html Msg 
view model = 
 div []
    [ input [ placeholder "Text to reverse", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]