/* shellosecond.cpp */

#ifdef _MSC_VER
  #define HELLO_EXPORTS
  #include "hello.h"
#endif
#include <iostream>

void shellosecond(){
   std::cout << "The second hello from a shared library\n";
}
