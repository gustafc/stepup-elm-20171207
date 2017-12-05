import Html exposing (Html, p, br, text)

type alias Person =
  { name: String
  , company: String
  }

type alias Dog =
  { name: String
  , age: Int
  , breed: String
  }

gustaf : Person
gustaf = Person "Gustaf" "Mejsla" -- Constructor function from type alias

theo : Dog
theo = -- Record literal to see what value goes where
  { name = "Theo"
  , age = 7
  , breed = "Pudel"
  }

-- Says hi to an arbitrary named object
sayHi : { a | name : String } -> String
sayHi { name } = "Hi, " ++ name ++ "!"

main : Html msg
main =
  p []
    [ text (sayHi gustaf),
      br [] [],
      text (sayHi theo)
    ]
