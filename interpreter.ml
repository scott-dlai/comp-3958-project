open Ast
open Stdio

(** Parse a given string into an expr. *)
let parse s =
  let lexbuf = Lexing.from_string s in
  Parser.prog Lexer.read lexbuf

(** Reads from stdin and evaluate the string expression. *)
let rec repl () =
  let () =
    printf "> ";
    Out_channel.flush stdout
  in
  match In_channel.input_line stdin with
  | None -> printf "\n\027[33mExited program.\027[0m\n"
  | Some line ->
      (try parse line |> eval |> printf "\027[32m%f\027[0m\n" with
      | _ -> printf "\027[31mInvalid input\027[0m\n");
      repl ()

