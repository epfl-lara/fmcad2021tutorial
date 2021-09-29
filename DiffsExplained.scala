import stainless.collection._
import stainless.equations._

object Diffs {
  def undiff(l: List[BigInt]): List[BigInt] =
    l.scanLeft(BigInt(0))(_ + _).tail
  def diffs(l: List[BigInt]): List[BigInt] = {
    l match {
      case Nil() => l
      case Cons(_,Nil()) => l
      case Cons(h1, Cons(h2, t)) =>

        diffs(Cons(h2, t)) match {
          case Cons(_, t1) =>
            val r = Cons(h1, Cons(h2 - h1, t1))

            (
              undiff(r) ==:| trivial |:
              undiff(h1 :: (h2 - h1) :: t1) ==:| trivial |:
              (h1 :: (h2 - h1) :: t1).scanLeft(BigInt(0))(_ + _).tail ==:| trivial |:
              (BigInt(0) :: ((h2 - h1) :: t1).scanLeft(h1)(_ + _)).tail ==:| trivial |:
              (h2 - h1 :: t1).scanLeft(h1)(_ + _) ==:| trivial |:
              h1 :: t1.scanLeft(h2)(_ + _) ==:| trivial |:
              h1 :: t1.scanLeft(diffs(h2 :: t).head)(_ + _) ==:| trivial |:
              h1 :: diffs(h2 :: t).tail.scanLeft(diffs(h2 :: t).head)(_ + _) ==:| trivial |:
              h1 :: (BigInt(0) :: diffs(h2 :: t).tail.scanLeft(diffs(h2 :: t).head)(_ + _)).tail ==:| trivial |: // scanLeft definition
              h1 :: diffs(h2 :: t).scanLeft(BigInt(0))(_ + _).tail ==:| trivial |: // undiffs definition
              h1 :: undiff(diffs(h2 :: t)) ==:| trivial |: // induction hyp
              h1 :: h2 :: t ==:| trivial |:
              l
            ).qed

            r
        }
    }
  } ensuring (undiff(_) == l)

  def test(x1: BigInt, x2: BigInt,
           x3: BigInt, x4: BigInt): Unit = {
  } ensuring(_ =>
    diffs(List(x1,x2,x3,x4)) ==
     List(x1, x2 - x1, x3 - x2, x4 - x3))

  // same as ensuring(res => res==true)
} 
