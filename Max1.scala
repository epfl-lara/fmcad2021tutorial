object TestMax {
  def max(x: Int, y: Int): Int = {
    if (x >= y) x
    else y
  } ensuring(res =>
    x <= res && y <= res && (res == x || res == y))
}
