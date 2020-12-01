{
open Parser
}

(** Regular expression for token. *)
let white = [' ' '\t']+
let digit = ['0'-'9']
let number = '-'? digit+'.'? digit+?

(** Rules for the lexer. Similar to the BNF form. *)
rule read =
  parse
  | white { read lexbuf }
  | "+" { ADD }
  | "-" { SUB }
  | "*" { MUL }
  | "/" { DIV }
  | "**" { EXP }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | number { NUMBER (float_of_string (Lexing.lexeme lexbuf)) }
  | eof { EOF }
