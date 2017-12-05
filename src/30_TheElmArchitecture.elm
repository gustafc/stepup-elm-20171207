import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
    { model = initialCounterState
    , view = renderCounterApp
    , update = updateCounter
    }

-- Model

type alias CounterModel =
  { count  : Int -- current count
  , clicks : Int -- number of times the model changed
  }
initialCounterState : CounterModel
initialCounterState = CounterModel 0 0

-- Update

type CounterEvent = Increase -- count + 1
                  | Decrease -- count - 1
                  | Reset    -- revert entire app state
updateCounter : CounterEvent -> CounterModel -> CounterModel
updateCounter event { count, clicks } =
    case event of
      Increase -> { count = count + 1, clicks = clicks + 1 }
      Decrease -> { count = count - 1, clicks = clicks + 1 }
      Reset    -> initialCounterState

-- View

renderCounterApp : CounterModel -> Html CounterEvent
renderCounterApp { count, clicks } =
  div []
    [ text ("Count = " ++ (toString count) ++
            ", clicks = " ++ (toString clicks))
    , div []
      [ button [onClick Decrease] [text "-"]
      , button [onClick Reset] [text "Reset"]
      , button [onClick Increase] [text "+"]
      ]
    ]
