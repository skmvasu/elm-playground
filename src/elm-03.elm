import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = Html.beginnerProgram {model=model, view= view, update= update}
type alias Model = 
    {name: String
    , password: String
    , passwordAgain: String}

model: Model

model  = Model "" "" ""

type Msg = 
    Name String
    | Password String
    | PasswordAgain String

update: Msg -> Model -> Model

update msg model =
    case msg of
        Name name -> 
            {model | name = name}
        Password password -> 
            {model | password = password}
        PasswordAgain passwordAgain -> 
            {model | passwordAgain = passwordAgain}


view: Model -> Html Msg
view model = 
    div []
        [
            input [type_ "text", placeholder "Name", onInput Name] []
            , input [type_ "text", placeholder "Password", onInput Password] []
            , input [type_ "text", placeholder "Enter password again", onInput PasswordAgain] []
            , viewValidation model
         ]

viewValidation: Model -> Html Msg
viewValidation model = 
    let (color, msg) = 
        if model.password == model.passwordAgain then
            ("green", "Valid")
        else
            ("red", "invalid")
    in
        div [style [("color", color)]] [text msg]

