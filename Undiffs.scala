def undiff(l: List[BigInt]): List[BigInt] =
  l.scanLeft(BigInt(0))(_ + _).tail
