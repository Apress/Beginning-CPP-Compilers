/* hello.h 
 MinGW compiler does not need this file.
*/

#pragma once

#ifdef HELLO_EXPORTS
 #define HELLO_API __declspec(dllexport)
#else
 #define HELLO_API __declspec(dllimport)
#endif

extern "C" {
  HELLO_API void shellofirst(void);
  HELLO_API void shellosecond(void);
}
