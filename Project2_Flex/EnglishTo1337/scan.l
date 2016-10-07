%{
#include <iostream>
  int words = 0;
%}
letter      [a-zA-Z]
%option noinput
%option nounput

%%
a|A			{ std::cout << "4"; }
b|B			{ std::cout << "8";}
c|C			{ std::cout << "("; }
d|D			{ std::cout << "|)";}
e|E         { std::cout << "3"; }
f|F			{ std::cout << "|\""; }
g|G			{ std::cout << "6"; }
h|H			{ std::cout << "|-|"; }
i|I			{ std::cout << "!"; }
j|J			{ std::cout << "_7"; }
k|K			{ std::cout << "|<"; }
l|L			{ std::cout << "1"; }
m|M			{ std::cout << "^^"; }
n|N			{ std::cout << "|\\|"; }
o|O			{ std::cout << "0"; }
p|P			{ std::cout << "|D"; }
q|Q			{ std::cout << "9"; }
r|R			{ std::cout << "|2"; }
s|S			{ std::cout << "5"; }
t|T			{ std::cout << "7"; }
u|U			{ std::cout << "\\_/"; }
v|V			{ std::cout << "\\/"; }
w|W			{ std::cout << "\\^/"; }
x|X			{ std::cout << "%"; }
y|Y			{ std::cout << "'/"; }
z|Z			{ std::cout << "2"; }
1			{ std::cout << "one"; }
2			{ std::cout << "two"; }
3			{ std::cout << "three"; }
4			{ std::cout << "four"; }
5			{ std::cout << "five"; }
6			{ std::cout << "six"; }
7			{ std::cout << "seven"; }
8			{ std::cout << "eight"; }
9			{ std::cout << "nine"; }
0			{ std::cout << "zero"; }
.          { std::cout << yytext; }
\n         { std::cout << std::endl; }
%%
int yywrap() { return 1; }

