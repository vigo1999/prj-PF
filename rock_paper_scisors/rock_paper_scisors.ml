type gesture =
  | Paper
  | Rock
  | Scissors

type result = 
  | Win of gesture * gesture
  | Lose of gesture * gesture
  | Tie of gesture

let hand g1 g2 =
  match g1 with
  | Paper ->
    (match g2 with 
    | Rock -> Win(g1, g2)
    | Paper -> Tie g1
    | Scissors -> Lose(g1, g2))
  | Rock ->
    (match g2 with
    | Rock -> Tie g1
    | Paper -> Lose(g1, g2)
    | Scissors -> Win(g1, g2))
  | Scissors -> 
    (match g2 with
    | Rock -> Lose(g1, g2)
    | Paper -> Win(g1, g2)
    | Scissors -> Tie g1)

let gesture_to_string g = 
  match g with
  | Paper -> "Paper"
  | Rock -> "Rock"
  | Scissors -> "Scissors"

