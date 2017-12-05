import Html exposing (Html, p, div, text)

type alias User =
  { id: String
  , name: String
  , age: OptionalInt
  }

type OptionalInt = Absent | Present Int

isTeen : User -> Bool
isTeen { age } =
  case age of
    Absent ->
      False
    Present knownAge ->
      13 <= knownAge && knownAge < 20

averageAge : List User -> Float
averageAge users =
  let
    ageToList = \{age} -> case age of
      Absent -> []
      Present knownAge -> [knownAge]
    knownAges = List.concatMap ageToList users
  in
    case knownAges of
      [] -> 0
      _ -> (List.sum knownAges |> toFloat) / (List.length knownAges |> toFloat)

db : List User
db =
  [ User "123" "Alice" Absent
  , User "123" "Bob" (Present 18)
  , User "123" "Charlie" (Present 22)
  ]

main : Html msg
main =
  div []
    [ p [] [text ("Average age is " ++ (averageAge db |> toString))]
    ]
