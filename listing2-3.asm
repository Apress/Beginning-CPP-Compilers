; Listing 2-3
; 
; Demonstrate two's complement operation and input of numeric values.
; msvcrt.lib(initializers.obj) : warning LNK4098: defaultlib 'libcmt.lib' conflicts with use of other libs; use /NODEFAULTLIB:library
; ml64 listing2-3.asm /link /NODEFAULTLIB:libcmt.lib
        includelib msvcrt.lib
        includelib legacy_stdio_definitions.lib
        includelib MyLibrary.lib

        option  casemap:none

nl       =      10  ;ASCII code for newline
maxLen   =      256

         .data
titleStr byte   'Listing 2-3', 0

prompt1  byte   "Enter an integer between 0 and 127: ", 0
fmtStr1  byte   "Value in hexadecimal: %x", nl, 0
fmtStr2  byte   "Invert all the bits (hexadecimal): %x", nl, 0
fmtStr3  byte   "Add 1 (hexadecimal): %x", nl, 0
fmtStr4  byte   "Output as signed integer: %d", nl, 0
fmtStr5  byte   "Using neg instruction: %d", nl, 0

intValue sqword ?
input    byte   maxLen dup (?)
            
            
            
            .code
            externdef printf:proc
            externdef atoi:proc
            externdef readLine:proc

; Return program title to C++ program:

            public getTitle
getTitle    proc
            lea rax, titleStr
            ret
getTitle    endp

        
; Here is the "main" function.

        
            public  main
main     proc
                           
; "Magic" instruction offered without explanation at this point:

            sub     rsp, 56
                
; Read an unsigned integer from the user: This code will blindly
; assume that the user's input was correct. The atoi function returns
; zero if there was some sort of error on the user input. Later
; chapters in Ao64A will describe how to check for errors from the
; user.

            lea     rcx, prompt1
            call    printf
        
            lea     rcx, input
            mov     rdx, maxLen
            call    readLine
        
; Call C stdlib atoi function.
;
; i = atoi( str )
        
            lea     rcx, input
            call    atoi
;            and     rax, 0ffh ; Only keep L.O. eight bits
            mov     intValue, rax
        
; Print the input value (in decimal) as a hexadecimal number:
        
            lea     rcx, fmtStr1
            mov     rdx, rax
            call    printf
        
; Perform the two's complement operation on the input number. 
; Begin by inverting all the bits (just work with a byte here).
        
            mov     rdx, intValue
            not     dl      ;Only work with 8-bit values!
            lea     rcx, fmtStr2
            call    printf
        
; Invert all the bits and add 1 (still working with just a byte)
        
            mov     rdx, intValue
            not     rdx
            add     rdx, 1
            and     rdx, 0ffh ; Only keep L.O. eight bits
            lea     rcx, fmtStr3
            call    printf
        
; Negate the value and print as a signed integer (work with a full
; integer here, because C++ %d format specifier expects a 32-bit
; integer. H.O. 32 bits of RDX get ignored by C++.
        
            mov     rdx, intValue
            not     rdx
            add     rdx, 1
            lea     rcx, fmtStr4
            call    printf
        
; Negate the value using the neg instruction.
        
            mov     rdx, intValue
            neg     rdx
            lea     rcx, fmtStr5
            call    printf

; Another "magic" instruction that undoes the effect of the previous
; one before this procedure returns to its caller.
       
            add     rsp, 56
            ret     ;Returns to caller
main     endp
            end
