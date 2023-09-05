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
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        _loginDialog(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,),
                      child: const Text('Ввійти',
                          style: TextStyle(color:Colors.white,fontSize: 18)),
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

void _loginDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(10),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 110),
                    child: Text('Вхід'),
                  ),
                  IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close))
                ],
              ),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusColor!,
                                )),
                                height: 60,
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset('lib/images/apple.png'),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusColor!,
                                )),
                                height: 60,
                                width: 60,
                                child: Padding(padding: const EdgeInsets.all(5),child: Image.asset('lib/images/google.png')),),),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                            thickness: 0.5,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor!),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7, right: 7, bottom: 4),
                        child: Text('або введи свій e-mail'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color:
                              Theme.of(context).inputDecorationTheme.focusColor!,
                        ),
                      )
                    ],
                  ),
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'Адреса e-mail',
                        hintStyle:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                      cursorColor: Colors.grey.shade400),
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'Пароль',
                        hintStyle:
                            TextStyle(color: Theme.of(context).disabledColor),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor),
                      ),
                      cursorColor: Colors.grey.shade400),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,),
                        child: Text('Вхід',
                         style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    'Забули пароль?',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Center(
                    child: Text.rich(
                      TextSpan(
                          text: 'Користуючись додатком ви погоджуєтесь з ',style: TextStyle(color: Theme.of(context).disabledColor,),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Правилами магазину',
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  decoration: TextDecoration.underline,
                                ))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Реєстрація',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).focusColor,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
