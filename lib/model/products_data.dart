abstract class Products {
  Products(this.typeOfProducts);

  final String typeOfProducts;
}

class TestProducts extends Products {
  TestProducts(super.typeOfProducts);
}
