grammar Crux;
program
 : declList EOF
 ;

declList
 : decl*
 ;

decl
 : varDecl
 ;

varDecl
 : Var Identifier type ';'
 ;

type
 : Identifier
 ;

literal
 : Integer
 | True
 | False
 ;

Integer
 : '0'
 | [1-9] [0-9]*
 ;

Var: 'var';

Identifier
 : [a-zA-Z] [a-zA-Z0-9_]*
 ;

WhiteSpaces
 : [ \t\r\n]+ -> skip
 ;

Comment
 : '//' ~[\r\n]* -> skip
 ;

AND
 : '&&'
 ;

OR
 : '||'
 ;

NOT
 : '!' 
 ;

VAR
 : 'var' 
 ;

FUNC
 : 'func' 
 ;

IF
 : 'if' 
 ;

ELSE
 : 'else' 
 ;

LOOP
 : 'loop' 
 ;

BREAK
 : 'break' 
 ;

CONTINUE
 : 'continue' 
 ;

TRUE
 : 'true' 
 ;

FALSE
 : 'false' 
 ;

RETURN
 : 'return' 
 ;