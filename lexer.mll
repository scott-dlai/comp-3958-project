{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let number = '-'? digit+'.'? digit?

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
