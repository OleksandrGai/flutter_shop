import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/favorite_screen_widgets/alert_dialogs_widget.dart';

class FavoriteScreen extends StatelessWidget {

  static const String routeName = '/favoriteScreen';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
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
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          ModalDialog().loginDialog(context);
                        },
                        child: Text('Ввійти',
                            style: TextStyle(color:Colors.white,fontSize: 18)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,),
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
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        ModalDialog().registrationDialog(context);
                      },
                      child: Text(
                        'Реєстрація',
                          style: TextStyle(color:Colors.white,fontSize: 18)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
