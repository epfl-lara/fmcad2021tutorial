def lemmaF(x: T): Unit = {
  lemmaG(x,x+1)
} ensuring (_ => F(x))
