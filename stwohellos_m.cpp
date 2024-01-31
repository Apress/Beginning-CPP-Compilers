/* stwohellos.cpp */

#ifdef _MSC_VER
  #include "hello.h"
#else
  void shellofirst(void);
  void shellosecond(void);
#endif

int main(){
  shellofirst();
  shellosecond();
  
  return 0;
}
