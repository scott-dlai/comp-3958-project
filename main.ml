open Stdio

(* Drives the program. *)
let () =
  printf "Welcome to calculator. Hit Ctrl-D to exit!\n";
  Interpreter.repl ()
