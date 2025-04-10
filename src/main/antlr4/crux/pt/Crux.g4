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

Var: 'var';

WhiteSpaces
 : [ \t\r\n]+ -> skip
 ;

Comment
 : '//' ~[\r\n]* -> skip
 ;

VOID : 'void' ;
BOOL : 'bool' ;
INT  : 'int' ;

AND : '&&' ;
OR : '||' ;
NOT : '!' ;
FUNC : 'func' ;
IF : 'if' ;
ELSE : 'else' ;
LOOP : 'loop' ;
BREAK : 'break' ;
CONTINUE : 'continue' ;
TRUE : 'true' ;
FALSE : 'false' ;
RETURN : 'return' ;

OPEN_PAREN : '(' ;
CLOSE_PAREN : ')' ;
OPEN_BRACE : '{' ;
CLOSE_BRACE : '}' ;
OPEN_BRACKET : '[' ;
CLOSE_BRACKET : ']' ;
ADD : '+' ;
SUB : '-' ;
MUL : '*' ;
DIV : '/' ;
GREATER_EQUAL : '>=' ;
LESSER_EQUAL : '<=' ;
NOT_EQUAL : '!=' ;
EQUAL : '==' ;
GREATER_THAN : '>' ;
LESS_THAN : '<' ;
ASSIGN : '=' ;
COMMA : ',' ;
COLON : ':' ;
SEMICOLON : ';' ;

Integer
 : '0'
 | [1-9] [0-9]*
 ;

Identifier
 : [a-zA-Z] [a-zA-Z0-9_]*
 ;

ERROR : . ;
