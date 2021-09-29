case class AmortizedQueue[A](front: List[A],
                             rear: List[A])
     extends Queue[A] {

  def toList = front ++ rear.reverse  
  
