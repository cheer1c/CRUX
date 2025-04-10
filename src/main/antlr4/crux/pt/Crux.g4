grammar Crux;
literal : Integer | TRUE | FALSE ;
designator : Identifier '[' expr0 ']' ;
type : Identifier ;


op0 : '>=' | '<=' | '!=' | '==' | '>' | '<' ;
op1 : '+' | '-' | '||' ;
op2 : '*' | '/' | '&&' ;


expr0 : expr1 [ op0 expr1 ] ;
expr1 : expr2 | expr1 op1 expr2 ;
expr2 : expr3 | expr2 op2 expr3 ;
expr3 : '!' expr3
 | '(' expr0 ')'
 | designator
 | callExpr
 | literal ;
callExpr : Identifier '(' exprList ')' ;
exprList : expr0 [',' expr0]* | ;


paramList : param [',' param]* | ;
param : Identifier type ;


varDecl : Var Identifier type ';' ;
arrayDecl : Var Identifier '[' Integer ']' type ';' ;
functionDefn : 'func' Identifier '(' paramList ')' [ type ] stmtBlock ';' ;
decl : varDecl | arrayDecl | functionDefn ;
declList : decl* ;


assignStmt : designator '=' expr0 ';' ;
callStmt : callExpr ';' ;
ifStmt : 'if' expr0 stmtBlock ['else' stmtBlock] ;
loopStmt : 'loop' stmtBlock ;
breakStmt : 'break' ';' ;
continueStmt : 'continue' ';' ;
returnStmt : 'return' expr0 ';' ;
stmt : varDecl | callStmt | assignStmt | ifStmt | loopStmt | breakStmt | continueStmt | returnStmt  ;
stmtList : stmt*  ;
stmtBlock : '{' stmtList '}' ;

program : declList EOF ;

Integer
 : '0'
 | [1-9] [0-9]*
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

Identifier : [a-zA-Z][a-zA-Z0-9]* ;
ERROR : . ;
