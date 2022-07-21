include Printf;;

type gesture =
  | Paper
  | Rock
  | Scissors
;;

type result =
  | Win of gesture * gesture
  | Lose of gesture * gesture
  | Tie of gesture
;;

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
;;

let gesture_to_string g =
  match g with
  | Paper -> "Paper"
  | Rock -> "Rock"
  | Scissors -> "Scissors"
;;

let int_to_gesture i =
  match i with
  | 1 -> Paper
  | 2 -> Rock
  | 3 -> Scissors
;;

let result_to_string res =
  match res with
  | Win (g1, g2) -> ("First player's " ^ gesture_to_string g1 ^ " beats second player's " ^ gesture_to_string g2)
  | Lose (g1, g2) -> ("Second player's " ^ gesture_to_string g2 ^ " beats first player's " ^ gesture_to_string g1)
  | Tie g -> ("Two " ^ gesture_to_string g ^ "s, the game is tied")
;;
(*
let rec play score1 score2 =
  print_string ("Player 1 : " ^ (score1) ^ " Player 2 : " ^ (score2));

  print_string "Choose player 1 hand : Rock (1) Paper (2) or Scisors (3)"
  let g1 =  read_int();;

  print_string "Choose player 2 hand : Rock (1) Paper (2) or Scisors (3)"
  let g2 =  read_int();;

  if((hand (int_to_gesture g1) (int_to_gesture g2)) = Win ((int_to_gesture g1), (int_to_gesture g2))) then
    play (score1+1) score2
  else if ((hand (int_to_gesture g1) (int_to_gesture g2)) = Lose ((int_to_gesture g1), (int_to_gesture g2))) then
    play score1 (score2+1)
  else if ((hand (int_to_gesture g1) (int_to_gesture g2)) = Tie ((int_to_gesture g1), (int_to_gesture g2))) then
    play score1 score2
;;*)

print_string "Choose player 1 hand : Rock (1) Paper (2) or Scisors (3)"
let g1 =  read_int();;

print_string "Choose player 2 hand : Rock (1) Paper (2) or Scisors (3)"
let g2 =  read_int();;

print_string (result_to_string (hand (int_to_gesture g1) (int_to_gesture g2)));;

