%{
open Ast
%}

(* Declaraiton for token *)
%token <float> NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token EXP
%token LPAREN
%token RPAREN
%token EOF

(* Associativity rules for operator. *)
%left ADD
%left SUB
%left MUL
%left DIV
%left EXP

(* Starting point of parsing, also tell that parser will return Ast.expr *)
%start <Ast.expr> prog

(* End of declartion section *)
%%

(* The first rule, `prog` is an expression followed bye EOF token *)
prog:
  | e = expr; EOF { e }
  ;

(* Rules for expr *)
expr:
  | n = NUMBER { Number n }
  | e1 = expr; ADD; e2 = expr { Binop (Add, e1, e2) }
  | e1 = expr; SUB; e2 = expr { Binop (Sub, e1, e2) }
  | e1 = expr; MUL; e2 = expr { Binop (Mul, e1, e2) }
  | e1 = expr; DIV; e2 = expr { Binop (Div, e1, e2) }
  | e1 = expr; EXP; e2 = expr { Binop (Exp, e1, e2) }
  | LPAREN; e=expr; RPAREN {e}
  ;

