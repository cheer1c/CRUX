package crux.ast;

import crux.ast.OpExpr.Operation;
import crux.pt.CruxBaseVisitor;
import crux.pt.CruxParser;
import crux.ast.types.*;
import crux.ast.SymbolTable.Symbol;
import org.antlr.v4.runtime.ParserRuleContext;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * This class will convert the parse tree generated by ANTLR to AST It follows the visitor pattern
 * where decls will be by DeclVisitor Class Stmts will be resolved by StmtVisitor Class Exprs will
 * be resolved by ExprVisitor Class
 */

public final class ParseTreeLower {
  private final DeclVisitor declVisitor = new DeclVisitor();
  private final StmtVisitor stmtVisitor = new StmtVisitor();
  private final ExprVisitor exprVisitor = new ExprVisitor();

  private final SymbolTable symTab;

  public ParseTreeLower(PrintStream err) {
    symTab = new SymbolTable(err);
  }

  private static Position makePosition(ParserRuleContext ctx) {
    var start = ctx.start;
    return new Position(start.getLine());
  }

  /**
   * Helper function to craete types for the AST nodes.
   */
  private static Type makeType(String name) {
    switch (name) {
      case "int":
        return new IntType();
      case "bool":
        return new BoolType();
      case "void":
        return new VoidType();
      default:
        return new ErrorType(String.format("Unknown type: %s.", name));
    }
  }

  /**
   *
   * @return True if any errors
   */
  public boolean hasEncounteredError() {
    return symTab.hasEncounteredError();
  }


  /**
   * Lower top-level parse tree to AST
   *
   * @return a {@link DeclList} object representing the top-level AST.
   */

  public DeclList lower(CruxParser.ProgramContext program) {
    return null;
  }

  /**
   * Lower stmt list by lower individual stmt into AST.
   *
   * @return a {@link StatementList} AST object.
   */
//  private StatementList lower(CruxParser.StmtListContext stmtList) {
//  }

  /**
   * Similar to {@link #lower(CruxParser.StmtListContext)}, but handles symbol table as well.
   *
   * @return a {@link StatementList} AST object.
   */
//  private StatementList lower(CruxParser.StmtBlockContext stmtBlock) {
//  }

  /**
   * A parse tree visitor to create AST nodes derived from {@link Declaration}
   */
  private final class DeclVisitor extends CruxBaseVisitor<Declaration> {
    /**
     * Visit a parse tree var decl and create an AST {@link VarDecl}
     *
     * @return an AST {@link VarDecl}
     */

//    @Override
//    public VarDecl visitVarDecl(CruxParser.VarDeclContext ctx) {
//    }


    /**
     * Visit a parse tree array decl and creates an AST {@link ArrayDecl}
     *
     * @return an AST {@link ArrayDecl}
     */
//    @Override
//    public Declaration visitArrayDecl(CruxParser.ArrayDeclContext ctx) {
//    }


    /**
     * Visit a parse tree function definition and create an AST {@link FuncDef}
     *
     * @return an AST {@link FuncDef}
     */
//    @Override
//    public Declaration visitFuncDefn(CruxParser.FuncDefnContext ctx) {
//    }
  }


  /**
   * A parse tree visitor to create AST nodes derived from {@link Statement}
   */

  private final class StmtVisitor extends CruxBaseVisitor<Statement> {
    /**
     * Visit a parse tree var decl and create an AST {@link VarDecl}. Since {@link VarDecl} is both
     * {@link Declaration} and {@link Statement}, we simply delegate this to
     * {@link DeclVisitor#visitArrayDecl(CruxParser.ArrayDeclContext)} which we implement earlier.
     *
     * @return an AST {@link VarDecl}
     */

//    @Override
//    public Statement visitVarDecl(CruxParser.VarDeclContext ctx) {
//
//    }

    /**
     * Visit a parse tree assignment stmt and create an AST {@link Assignment}
     *
     * @return an AST {@link Assignment}
     */
//    @Override
//    public Statement visitAssignStmt(CruxParser.AssignStmtContext ctx) {
//    }

    /**
     * Visit a parse tree call stmt and create an AST {@link FuncCall}. Since {@link FuncCall} is
     * both {@link Expression} and {@link Statement}, we simply delegate this to
     * {@link ExprVisitor#visitCallExpr(CruxParser.CallExprContext)} that we will implement later.
     *
     * @return an AST {@link FuncCall}
     */
//    @Override
//    public Statement visitCallStmt(CruxParser.CallStmtContext ctx) {
//
//    }

    /**
     * Visit a parse tree if-else branch and create an AST {@link IfElseBranch}. The template code
     * shows partial implementations that visit the then block and else block recursively before
     * using those returned AST nodes to construct {@link IfElseBranch} object.
     *
     * @return an AST {@link IfElseBranch}
     */
//    @Override
//    public Statement visitIfStmt(CruxParser.IfStmtContext ctx) {
//
//    }

    /**
     * Visit a parse tree for loop and create an AST {@link Loop}. You're going to use a similar
     * techniques as {@link #visitIfStmt(CruxParser.IfStmtContext)} to decompose this construction.
     *
     * @return an AST {@link Loop}
     */
//    @Override
//    public Statement visitLoopStmt(CruxParser.LoopStmtContext ctx) {
//    }

    /**
     * Visit a parse tree return stmt and create an AST {@link Return}. Here we show a simple
     * example of how to lower a simple parse tree construction.
     *
     * @return an AST {@link Return}
     */
//    @Override
//    public Statement visitReturnStmt(CruxParser.ReturnStmtContext ctx) {
//    }

    /**
     * Creates a Break node
     */
//    @Override
//    public Statement visitBreakStmt(CruxParser.BreakStmtContext ctx) {
//
//    }

    /**
     * Creates a Continue node
     */
//    @Override
//    public Statement visitContinueStmt(CruxParser.ContinueStmtContext ctx) {
//
//    }
  }

  private final class ExprVisitor extends CruxBaseVisitor<Expression> {
    /**
     * Parse Expr0 to OpExpr Node Parsing the expr should be exactly as described in the grammer
     */
//    @Override
//    public Expression visitExpr0(CruxParser.Expr0Context ctx) {
//    }

    /**
     * Parse Expr1 to OpExpr Node Parsing the expr should be exactly as described in the grammer
     */
//    @Override
//    public Expression visitExpr1(CruxParser.Expr1Context ctx) {
//
//    }

//    private Expression makeExpr(CruxParser.Op1Context op1, Expression left, Expression right) {
//    }

    /**
     * Parse Expr2 to OpExpr Node Parsing the expr should be exactly as described in the grammer
     */
//    @Override
//    public Expression visitExpr2(CruxParser.Expr2Context ctx) {
//    }

//    private Expression makeExpr(CruxParser.Op2Context op2, Expression left, Expression right) {
//
//    }

    /**
     * Parse Expr3 to OpExpr Node Parsing the expr should be exactly as described in the grammer
     */
//    @Override
//    public Expression visitExpr3(CruxParser.Expr3Context ctx) {
//    }

    /**
     * Create an Call Node
     */
//    @Override
//    public FuncCall visitCallExpr(CruxParser.CallExprContext ctx) {
//
//    }

    /**
     * visitDesignator will check for a name or ArrayAccess FYI it should account for the case when
     * the designator was dereferenced
     */
//    @Override
//    public Expression visitDesignator(CruxParser.DesignatorContext ctx) {
//    }

    /**
     * Create an Literal Node
     */
//    @Override
//    public Expression visitLiteral(CruxParser.LiteralContext ctx) {
//
//    }
  }
}
