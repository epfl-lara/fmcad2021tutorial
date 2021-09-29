case class SimpleQueue[A](l: List[A])
     extends Queue[A] {
  def enqueue(a: A) = SimpleQueue(l ++ List(a))

  def dequeue = l match {
    case Nil() => None()
    case Cons(x, xs) => Some((x, SimpleQueue(xs)))
  }

  def toList = l
}
