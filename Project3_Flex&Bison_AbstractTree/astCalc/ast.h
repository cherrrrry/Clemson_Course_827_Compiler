//  Declarations for an AST calculator
//  From "flex & bison", fb3-1, by John Levine
//  Adapted by Brian Malloy

/* Name: Clemson University 827 Project 3
   Author: Rui Chang
   Date: 2016-10-06
*/
#include <string>
#include <sstream>
#include <math.h>
extern void yyerror(const char*);
extern void yyerror(const char*, const char);

class Ast {
public:
  Ast(std::string nodeLabel, Ast* l, Ast* r) : label(nodeLabel), left(l), right(r), name(0) {}
  virtual ~Ast() {
    if(left){ delete left; }
	if(right){ delete right; }
  }
  void setLabel(std::string& s) { label = s; }
  std::string getLabel() const { return label; }
  virtual Ast* getLeft() const { return left; }
  virtual Ast* getRight() const { return right; }
  virtual double getVal() const { throw std::string("No Value"); }
  void setName(int& a) { name = a; }
  int getName() const { return name; }
private:
  std::string label;
  Ast* left;
  Ast* right;
  int name;
};

class AstNumber : public Ast {
public:
  AstNumber(double n) : Ast( "", NULL, NULL), number(n) {
	std::stringstream ss;
	ss << n;
	std::string s = ss.str();
	Ast::setLabel(s);
  } 
  virtual ~AstNumber() {}
  virtual double getVal() const { return number; }
private:
  double number;
};

class AddNode : public Ast {
public:
  AddNode(Ast* l, Ast* r) : Ast("+", l, r) { }
  double getVal() const { return Ast::getLeft()->getVal() + Ast::getRight()->getVal(); }
};

class MinusNode: public Ast {
public:
  MinusNode(Ast* l, Ast* r) : Ast("-", l, r) { }
  double getVal() const{ return Ast::getLeft()->getVal() - Ast::getRight()->getVal(); }
};

class DivNode: public Ast {
public:
  DivNode(Ast* l, Ast* r) : Ast("/", l, r) { }
  double getVal() const{ return Ast::getLeft()->getVal()  / Ast::getRight()->getVal(); }
};

class MultNode: public Ast {
public:
  MultNode(Ast* l, Ast* r) : Ast("*", l, r) { }
  double getVal() const{ return Ast::getLeft()->getVal()  *  Ast::getRight()->getVal(); }
};

class ExponentNode: public Ast {
public:
  ExponentNode(Ast* l, Ast* r) : Ast("**", l, r) { }
  double getVal() const{ return pow( Ast::getLeft()->getVal()  ,  Ast::getRight()->getVal()); }
};

class LeftMinusNode: public Ast {
public:
  LeftMinusNode(Ast* l, Ast* r) : Ast("-", l, r) { }
  double getVal() const{ return - Ast::getLeft()->getVal(); }
};



double eval(Ast*);   // Evaluate an AST
void makeGraph(Ast*); // draw Graph of AST
void treeFree(Ast*); // delete and free an AST 

