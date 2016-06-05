;
;   Register Test
;       Tests all registers opcodes

REGISTER:
    UBYTE 0x00 ; r
    UBYTE 0x00
    UBYTE 0x7C
    UBYTE 0x66 ;
    UBYTE 0x60
    UBYTE 0x60 ;
    UBYTE 0x60
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x00 ;  e
    UBYTE 0x3C
    UBYTE 0x66 ;
    UBYTE 0x7E
    UBYTE 0x60 ;
    UBYTE 0x3C
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x00 ;  g
    UBYTE 0x3E
    UBYTE 0x66 ;
    UBYTE 0x66
    UBYTE 0x3E ;
    UBYTE 0x06
    UBYTE 0x7C ;
    UBYTE 0x00
    UBYTE 0x18 ;  i
    UBYTE 0x00
    UBYTE 0x38 ;
    UBYTE 0x18
    UBYTE 0x18 ;
    UBYTE 0x3C
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x00 ;  s
    UBYTE 0x3E
    UBYTE 0x60 ;
    UBYTE 0x3C
    UBYTE 0x06 ;
    UBYTE 0x7C
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x18 ;  t
    UBYTE 0x7E
    UBYTE 0x18 ;
    UBYTE 0x18
    UBYTE 0x18 ;
    UBYTE 0x0E
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x00 ;  e
    UBYTE 0x3C
    UBYTE 0x66 ;
    UBYTE 0x7E
    UBYTE 0x60 ;
    UBYTE 0x3C
    UBYTE 0x00 ;
    UBYTE 0x00
    UBYTE 0x00 ;  r
    UBYTE 0x7C
    UBYTE 0x66 ;
    UBYTE 0x60
    UBYTE 0x60 ;
    UBYTE 0x60
    UBYTE 0x00 ;
OKAY:
    UWORD 0x3C30 ;  [
    UWORD 0x3030 ;
    UWORD 0x3030 ;
    UWORD 0x3C00 ;
    UWORD 0x0000 ; ' '
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x0000 ;  o
    UWORD 0x3C66 ;
    UWORD 0x6666 ;
    UWORD 0x3C00 ;
    UWORD 0x0060 ;  k
    UWORD 0x606C ;
    UWORD 0x786C ;
    UWORD 0x6600 ;
    UWORD 0x0000 ;  a
    UWORD 0x3C06 ;
    UWORD 0x3E66 ;
    UWORD 0x3E00 ;
    UWORD 0x0000 ;  y
    UWORD 0x6666 ;
    UWORD 0x663E ;
    UWORD 0x0C78 ;
    UWORD 0x0000 ; ' '
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x3C0C ;  ]
    UWORD 0x0C0C ;
    UWORD 0x0C0C ;
    UWORD 0x3C00 ;
FAIL:
    UWORD 0x3C30 ;  [
    UWORD 0x3030 ;
    UWORD 0x3030 ;
    UWORD 0x3C00 ;
    UWORD 0x0000 ; ' '
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x000E ;  f
    UWORD 0x183E ;
    UWORD 0x1818 ;
    UWORD 0x1800 ;
    UWORD 0x0000 ;  a
    UWORD 0x3C06 ;
    UWORD 0x3E66 ;
    UWORD 0x3E00 ;
    UWORD 0x0018 ;  i
    UWORD 0x0038 ;
    UWORD 0x1818 ;
    UWORD 0x3C00 ;
    UWORD 0x0038 ;  l
    UWORD 0x1818 ;
    UWORD 0x1818 ;
    UWORD 0x3C00 ;
    UWORD 0x0000 ; ' '
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x0000 ;
    UWORD 0x3C0C ;  ]
    UWORD 0x0C0C ;
    UWORD 0x0C0C ;
    UWORD 0x3C00 ;

PRINT:
    ; Requires:
    ;    I : String
    ;   V0 : x
    ;   V1 : y
    ;   V2 : String Length
    ; Uses:
    ;   V3 : Index
    ;   V4 : Character Width
    LD  V3, 0x00
    LD  V4, 0x08
PRINT.WHILE:
    SNE V2, V3
    JP PRINT.BREAK
    DRW V0, V1, 0x8 ; Character Height
    ADD  I, V4
    ADD V0, V4
    ADD V3, 0x01
    JP PRINT.WHILE
PRINT.BREAK:
    RET

MAIN:
    ; Print title
    LD  I, REGISTER ; String
    LD V0, 0x00     ; x
    LD V1, 0x00     ; y
    LD V2, 0x08     ; String length
    CALL   PRINT
    ; Print status
    LD  I, FAIL     ; String
    LD V0, 0x00     ; x
    LD V1, 0x08     ; y
    LD V2, 0x08     ; String length
    CALL   PRINT
    ; Push any key to exit
    LD VF, K
    END
