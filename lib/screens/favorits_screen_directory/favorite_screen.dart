import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  static const String routeName = '/favoriteScreen';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Мій вибір', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 20),
                  child: Text('Закладка мій вибір порожня',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Додавайте товари до закладки за допомогою',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                Text('Вже маєте акаунт?',
                    style: Theme.of(context).textTheme.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Увійдіть в свій акаунт,щоб синхронізувати закладку мій вибір на різних девайсах.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Ввійти',
                        style: Theme.of(context).textTheme.titleLarge),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      side: BorderSide(
                          color: Theme.of(context).unselectedWidgetColor),
                      maximumSize: const Size(300, 50),
                      minimumSize: const Size(260, 50),
                    ),
                  ),
                ),
                Text('Ви досі не маєте акаунту?',
                    style: Theme.of(context).textTheme.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Зареєструйтесь та еористуйтесь спеціальними пропозиціями для клієнтів з акаунтом.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Реєстрація',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.transparent,
                    side: BorderSide(
                        color: Theme.of(context).unselectedWidgetColor),
                    maximumSize: const Size(300, 50),
                    minimumSize: const Size(260, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
