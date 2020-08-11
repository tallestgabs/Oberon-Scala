grammar Oberon;

start : CompilationUnit ;

CompilationUnit
  : 'MODULE' Id ';' ('CONST' Constant*)? 'END' Id '.'
  ;  

Constant
  : Id '=' Number ';'
  ;   

Id : CharDef (CharDef | Digit | '_')* ; 

CharDef
  : ('a'..'z') | ('A' .. 'Z')
  ; 

Number
  : '1'..'9' (Digit)*
  ;
  
Digit
  : '0'..'9'
  ;
  
//
// Whitespace and comments
//

NL
   : '\n'
   | '\r' '\n'?
   ;
   

fragment WhiteSpace
   : '\u0020' | '\u0009' | '\u000D' | '\u000A'
   ;
   
NEWLINE
   : NL+ -> skip
   ;

WS
   :  WhiteSpace+ -> skip
   ;

COMMENT
   :   '/*' .*? '*/' -> skip
   ;


LINE_COMMENT
   :   '//' (~[\r\n])* -> skip
   ;