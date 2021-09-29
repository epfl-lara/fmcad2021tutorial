import stainless.annotation._
import stainless.lang._
import stainless.collection._
object AddBitwise {
  type Digits = List[Boolean]
  val zero = Nil[Boolean]()

  def add(x: Digits, y: Digits, carry: Boolean): Digits = {    
    require(x.length == y.length)
    (x,y) match {
      case (Nil(), Nil()) =>
        if (carry) true::zero else zero
      case (Cons(x1,xs), Cons(y1,ys)) => {
        val z = x1 ^ y1 ^ carry
        val carry1 = (x1 && y1) ||
                     (x1 && carry) ||
                     (y1 && carry)
        z :: add(xs, ys, carry1)
      }
    }
  }
}
