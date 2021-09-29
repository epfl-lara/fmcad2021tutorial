import stainless.collection._ 
object Diffs {
  def diffs(l: List[BigInt]): List[BigInt] = {    
    l match {
      case Nil() => l
      case _ :: Nil() => l
      // missing cases
    }
  }
  def test(x1: BigInt, x2: BigInt,
           x3: BigInt, x4: BigInt): Unit = {
  } ensuring(_ =>
    diffs(List(x1,x2,x3,x4)) ==
     List(x1, x2 - x1, x3 - x2, x4 - x3))
} 
