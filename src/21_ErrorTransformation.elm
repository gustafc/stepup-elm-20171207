import Html exposing (Html, p, div, text)

stringsToParse : List String
stringsToParse =
  [ "1"
  , "3.14"
  , "42"
  , "lol"
  ]

sumOfAllParsable : List (Result String Int) -> Int
sumOfAllParsable parsed =
  List.filterMap Result.toMaybe parsed
  |> List.sum

sumOfAll : List (Result String Int) -> (Result String Int)
sumOfAll parsed =
  let
    addResults = Result.map2 (+)
  in
    List.foldr addResults (Ok 0) parsed

main : Html msg
main =
  let
    parsedStrings = List.map String.toInt stringsToParse
  in
    div []
      [ p [] [sumOfAllParsable parsedStrings |> toString |> text]
      , p [] [sumOfAll parsedStrings |> toString |> text]
      ]
