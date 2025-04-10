grammar Crux;
program : declList EOF ;

literal : Integer | TRUE | FALSE ;
designator : Identifier (OPEN_BRACE expr0 CLOSE_BRACE)? ;
type : Identifier ;

declList : decl* ;
decl : varDecl | arrayDecl | funcDefn ;
varDecl : Var Identifier type SEMICOLON ;
arrayDecl : Var Identifier OPEN_BRACKET Integer CLOSE_BRACKET type SEMICOLON ;
funcDefn : FUNC Identifier OPEN_PAREN paramList CLOSE_PAREN  (type)?  stmtBlock ;


paramList : ( param (COMMA param)* )? ;
param : Identifier type ;


assignStmt : designator ASSIGN expr0 SEMICOLON ;
callStmt : callExpr SEMICOLON ;
ifStmt : IF expr0 stmtBlock (ELSE stmtBlock)? ;
loopStmt : LOOP stmtBlock ;
breakStmt : BREAK SEMICOLON ;
continueStmt : CONTINUE SEMICOLON ;
returnStmt : RETURN expr0 SEMICOLON ;
stmt : varDecl | callStmt | assignStmt | ifStmt | loopStmt | breakStmt | continueStmt | returnStmt  ;
stmtList : stmt*  ;
stmtBlock : OPEN_BRACE stmtList CLOSE_BRACE ;


op0 : GREATER_EQUAL | LESSER_EQUAL | NOT_EQUAL | EQUAL | GREATER_THAN | LESS_THAN ;
op1 : ADD | SUB | OR ;
op2 : MUL | DIV | AND ;


expr0 : expr1 (op0 expr1)?  ;
expr1 : expr2 | expr1 op1 expr2 ;
expr2 : expr3 | expr2 op2 expr3 ;
expr3 : NOT expr3
 | OPEN_PAREN expr0 CLOSE_PAREN
 | designator
 | callExpr
 | literal ;
callExpr : Identifier OPEN_PAREN exprList CLOSE_PAREN ;
exprList :  ( expr0 (COMMA expr0)* )? ;

Var: 'var' ;
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

Integer : '0' | [1-9] [0-9]* ;
Identifier : ('_' | [a-zA-Z]) ('_' | [a-zA-Z0-9])* ;
WhiteSpaces : [ \t\r\n]+ -> skip ;
Comment : '//' ~[\r\n]* -> skip ;
ERROR : . ;