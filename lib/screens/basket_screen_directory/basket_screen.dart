import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Кошик', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170, bottom: 20),
                  child: Text('Ваш кошик порожній',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Ходімо щось виберемо!',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Text('Вже маєте акаунт?',
                    style: Theme.of(context).textTheme.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Залогуйтесь, щоб синхронізувати власний кошик на різних ваших девайсах.',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
