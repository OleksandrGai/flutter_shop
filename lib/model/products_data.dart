abstract class Products {
  Products(this.typeOfProducts);

  final String typeOfProducts;
}

class TestProducts extends Products {
  TestProducts(super.typeOfProducts);
}

final List<Products> productsCategoryListCategoriesScreen = [
  TestProducts('Одяг'),
  TestProducts('Взуття'),
  TestProducts('Аксесуари'),
  TestProducts('Бренди'),
  TestProducts('Розпродаж'),
];

final List<Products> clothesCategoryListCategoriesScreen = [
  TestProducts('Блузки'),
  TestProducts('Джинси'),
  TestProducts('Кофти'),
  TestProducts('Брюки'),
  TestProducts('Білизна'),
  TestProducts('Купальники'),
  TestProducts('Пальта'),
  TestProducts('Куртки'),
];

final List<Products> shoesCategoryListCategoriesScreen = [
  TestProducts('Кросівки'),
  TestProducts('Єспадрилі'),
  TestProducts('Кеди'),
  TestProducts('Сланци'),
  TestProducts('Ботинки'),
  TestProducts('Гумові чоботи'),
];
final List<Products> accessoriesCategoryListCategoriesScreen = [
  TestProducts('Біжутерія'),
  TestProducts('Парфуми'),
  TestProducts('Годинники'),
  TestProducts('Гаманці'),
  TestProducts('Окуляри'),
  TestProducts('Маски'),
];
final List<Products> brandsListCategoriesScreen = [
  TestProducts('Moncler'),
  TestProducts('Amiri'),
  TestProducts('Bally'),
  TestProducts('Marni'),
  TestProducts('PLEASURES'),
  TestProducts('Reebok'),
  TestProducts('Santoni'),
  TestProducts('Adidas'),
  TestProducts('Puma'),
  TestProducts('H&M'),
  TestProducts('ZARA'),
  TestProducts('Nike'),
];