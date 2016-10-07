%{
#include <iostream>
  //int words = 0;
%}
letter      [a-zA-Z]
%option noinput
%option nounput

%%
4			{ std::cout << "a"; }
8			{ std::cout << "b";}
\(			{ std::cout << "c"; }
\|\)		{ std::cout << "d";}
3           { std::cout << "e"; }
\|\"		{ std::cout << "f"; }
6			{ std::cout << "g"; }
\|-\|		{ std::cout << "h"; }
!			{ std::cout << "i"; }
_7			{ std::cout << "j"; }
\|<			{ std::cout << "k"; }
1			{ std::cout << "l"; }
\^\^		{ std::cout << "m"; }
\|\\\|		{ std::cout << "n"; }
0			{ std::cout << "o"; }
\|D			{ std::cout << "p"; }
9			{ std::cout << "q"; }
\|2			{ std::cout << "r"; }
5			{ std::cout << "s"; }
7			{ std::cout << "t"; }
\\_\/		{ std::cout << "u"; }
\\\/		{ std::cout << "v"; }
\\^\/		{ std::cout << "w"; }
%			{ std::cout << "x"; }
'\/			{ std::cout << "y"; }
2			{ std::cout << "z"; }
one			{ std::cout << "1"; }
two			{ std::cout << "2"; }
three		{ std::cout << "3"; }
four		{ std::cout << "4"; }
five		{ std::cout << "5"; }
six			{ std::cout << "6"; }
seven		{ std::cout << "7"; }
eight		{ std::cout << "8"; }
nine		{ std::cout << "9"; }
zero		{ std::cout << "0"; }
.           { std::cout << yytext; }
\n          { std::cout << std::endl; }
%%
int yywrap() { return 1; }

