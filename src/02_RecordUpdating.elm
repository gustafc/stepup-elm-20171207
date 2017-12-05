import Html exposing (Html, p, br, text)

type alias Employee =
  { name: String
  , title: String
  , salary: Int
  }

gustaf : Employee
gustaf = Employee "Gustaf" "Developer" 50000

enterprisify : { a | title: String, salary: Int} -> { a | title: String, salary: Int}
enterprisify ({title, salary} as employee) =
  { employee
  | title = "Senior Enterprise " ++ title
  , salary = salary * 2
  }

kungen =
  { name = "Carl-Gustaf"
  , title = "King of Sweden"
  , salary = 10000000
  , dynasty = "Bernadotte"
  }

lineBreak : Html msg
lineBreak = br [] []

main : Html msg
main =
  p []
    [ toString gustaf |> text
    , lineBreak
    , enterprisify gustaf |> toString |> text
    , lineBreak
    , toString kungen |> text
    , lineBreak
    , enterprisify kungen |> toString |> text
    ]
