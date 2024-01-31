/* shellofirst.cpp */

#ifdef _MSC_VER
  #define HELLO_EXPORTS
  #include "hello.h"
#endif
#include <iostream>

void shellofirst(){
   std::cout << "The first hello from a shared library\n";
}
