def enqueue(a: A): Queue[A] = {
  val res: Queue[A] = // to fill

  // You can state using assertions things you know are true,
  // to see if Stainless is able to prove them:
  assert(res.toList == front ++ (a :: rear).reverse)

  // Alternatively, you can use an equation style reasoning.
  // Here Stainless should timeout from the second to the third
  // step, because some steps are missing.
  (
    res.toList                         ==:| trivial |:
    front ++ (a :: rear).reverse       ==:| trivial |:
    // Add missing steps here to arrive to the result.
    // For complicated steps, you need to invoke lemmas
    // instead of writing `trivial`.
    this.toList ++ List(a)
  ).qed

  res
}
