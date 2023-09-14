import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/favorite_screen_widgets/user_accept_widget.dart';

class ModalDialog {
  void loginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                insetPadding: const EdgeInsets.all(9),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    const Text('Вхід'),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset('lib/images/google.png')),
                            ),
                          ),
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
                          padding:
                              EdgeInsets.only(left: 7, right: 7, bottom: 4),
                          child: Text('або введи свій e-mail'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor!,
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
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Вхід',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Забули пароль?',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text.rich(
                        TextSpan(
                            text: 'Користуючись додатком ви погоджуєтесь з ',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => print('Заглушка'),
                                text: 'Правилами магазину',
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  decoration: TextDecoration.underline,
                                ),
                              )
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

  void registrationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                insetPadding: const EdgeInsets.all(9),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    const Text('Зареєструватися'),
                    IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)),
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
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset('lib/images/google.png')),
                            ),
                          ),
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
                          padding:
                              EdgeInsets.only(left: 7, right: 7, bottom: 4),
                          child: Text('або введи свій e-mail'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor!,
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
                      height: 8,
                    ),
                    Text(
                      '*мінімально 8 символів,включаючи одну велику літеру',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const UserAcceptWidget(
                      mainText: 'Погоджуюсь з ',
                      underlineText: 'Правилами магазину',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const UserAcceptWidget(
                      mainText:
                          'Хочу отримувати комерційну інформацію від магазину на вказану електронну адресу',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Створити акаунт',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
