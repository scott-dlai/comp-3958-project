type bop =
  | Add
  | Sub
  | Mul
  | Div
  | Exp

type expr =
  | Number of float
  | Binop of bop * expr * expr

let func_of_bop = function
  | Add -> ( +. )
  | Sub -> ( -. )
  | Mul -> ( *. )
  | Div -> ( /. )
  | Exp -> ( ** )

let rec eval = function
  | Number n -> n
  | Binop (op, e1, e2) -> func_of_bop op (eval e1) (eval e2)
