import stainless.collection._
import stainless.lang._
abstract class Queue[A] {
  def enqueue(a: A) = (??? : Queue[A])
    .ensuring(res =>
    res.toList == this.toList ++ List(a))

  def dequeue: Option[(A, Queue[A])] =
    (??? : Option[(A, Queue[A])])
  .ensuring(res => res match {
    case None() =>
      this.toList == Nil[A]()
    case Some((a, q)) =>
      this.toList == a :: q.toList
    })

  def toList: List[A]
}
