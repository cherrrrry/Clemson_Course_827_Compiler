//  Source code for "flex & bison", by John Levine
//  Declarations for an AST calculator fb3-1
//  Adapted by Brian Malloy

/* Name: Clemson University 827 Project 3
   Author: Rui Chang
   Date: 2016-10-05
*/
%{
#include <iostream>
#include <fstream>
#include "ast.h"
  extern int yylex();
  int count = 1;
  void yyerror(const char *s) { std::cout << s << std::endl; }
  void yyerror(const char *s, const char ch) {
    std::cout << s << ch << std::endl;
  }
%}

%union {
  Ast* ast;
  double d;
}

%token <d> NUMBER
%left ADD MINUS
%left MULT DIV
%left EXP
%token EOL
%type <ast> exp
%%

calclist 
       : calclist exp EOL {
           std::cout << "= " << eval($2) << std::endl;
           makeGraph($2);
		   treeFree($2);
           std::cout << "> ";
         }
       | calclist EOL // blank line or a comment
       | // empty
       ;

exp    : exp ADD exp { $$ = new AddNode($1, $3); }
       | exp MINUS exp { $$ = new MinusNode($1, $3); }
       | exp DIV exp { $$ = new DivNode($1, $3); }
       | exp MULT exp { $$ = new MultNode($1, $3); }
       | exp EXP exp { $$ = new ExponentNode($1, $3); }
	   | '(' exp ')' { $$ = $2; }
       | MINUS exp    { $$ = new LeftMinusNode($2, NULL); }
	   | NUMBER { $$ = new AstNumber($1); }
       ;
%%
