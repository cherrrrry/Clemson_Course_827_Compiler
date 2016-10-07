// Companion source code for "flex & bison", published by O'Reilly
// helper functions for fb3-1

/* Clemson University 827 Project3
   Author: Rui Chang 
   Date: 2016-10-06
*/
#  include <iostream>
#  include <fstream>
#  include <stdlib.h>
#  include <math.h>
#  include "ast.h"
double eval(Ast* a){
  return a->getVal();
}
void makeName(Ast * node, std::fstream & out, int& count){ // specify name and label for every node 
  if( node == NULL) return;
  if( node ){
    if( node -> getName() == 0 ){
	  node->setName(count);
	  out << "  " << count << "  [label = \"" << node->getLabel() << "\"];" << std::endl;
 	}
    ++count ;
  }
  makeName(node->getLeft(), out, count);
  makeName(node->getRight(), out, count);
}

void makeConnection(Ast* node, std::fstream &out){
  if( !node->getLeft() && !node->getRight()){
    return;
  }else if( node->getLeft() && !node->getRight()){
    out << "  " << node->getName() << "->" << node->getLeft()->getName() << std::endl;
    makeConnection( node->getLeft(), out );
  }else{
    out << "  " << node->getName() << "->" << node->getLeft()->getName() << std::endl;
    makeConnection( node->getLeft(), out );
    out << "  " << node->getName() << "->" << node->getRight()->getName() << std::endl;
    makeConnection (node->getRight(), out );
  }
}

void makeGraph(Ast* node){
  std::fstream out;
  int count = 1;
  out.open( "graph.gv", std::ios::out );
  out << "digraph G { " << std::endl;
  makeName( node, out, count );
  makeConnection( node, out );
  out << "}" << std::endl;
}

void treeFree(Ast * a){
  if( a ){
    delete a;
  }
}
