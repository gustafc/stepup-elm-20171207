import Html exposing (Html, div, pre, text)

showValue : a -> Html msg
showValue v = pre [] [text (toString v)]

showValues : List a -> Html msg
showValues items =
  div [] (List.map showValue items)


main : Html msg
main =
  showValues
    [ String.toInt("123")
    , String.toInt("abc")
    ]
