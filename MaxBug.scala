object TestMax {
  def max(x: Int, y: Int): Int = {
    val d = x - y
    if (d > 0) x
    else y
  } ensuring(res =>
    x <= res && y <= res && (res == x || res == y))
}
