import stainless.lang._ // for Stainless' Option

object FindIndex {

  def findIndexOpt(ar: Array[Int], v: Int): Option[Int] = {
    var lo = 0
    var hi = ar.length - 1

    (while (lo <= hi) {
      decreases(hi - lo)

      val i = lo + (hi - lo) / 2
      val x = ar(i)

      if (v == x) return Some[Int](i)
      else if (v < x) hi = i-1
      else lo = i +1
    }).invariant(
      0 <= lo &&
      hi < ar.length &&
      lo <= hi + 1
    )

    None[Int]()
  }.ensuring((res: Option[Int]) => res match {
    case Some(i) => 0 <= i && i < ar.length && ar(i) == v
    case None() => true // we don't ensure anything in case the function returns None
  })

}
