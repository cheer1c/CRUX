package crux.ir;

import crux.ast.types.IntType;
import java.util.HashMap;

/**
 * A constant integer, e.g. an array offset (like the 2 in a[2]). This is equivalent to
 * {@link crux.ast.LiteralInt}.
 */
public final class IntegerConstant extends Constant implements java.io.Serializable {
  static final long serialVersionUID = 12022L;
  private long mValue;

  private IntegerConstant(Program ctx, long val) {
    super(new IntType());
    mValue = val;
  }

  public long getValue() {
    return mValue;
  }

  public static IntegerConstant get(Program ctx, long value) {
    var currentMap = mIntConstantPool.computeIfAbsent(ctx, p -> new HashMap<>());
    return currentMap.computeIfAbsent(value, p -> new IntegerConstant(ctx, value));
  }
}
