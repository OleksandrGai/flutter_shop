import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/widgets/favorite_screen_widgets/user_accept_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';

class ModalDialog {
  void loginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, locale) {
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
                      Text(AppLocalizations.of(context)!.logIn),
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
                                      child:
                                          Image.asset('lib/images/apple.png'),
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
                                    child:
                                        Image.asset('lib/images/google.png')),
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: 7, right: 7, bottom: 4),
                            child: Text(
                              AppLocalizations.of(context)!.enterEmail,
                            ),
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
                            hintText: AppLocalizations.of(context)!.email,
                            hintStyle: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                          cursorColor: Colors.grey.shade400),
                      TextField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            hintStyle: TextStyle(
                                color: Theme.of(context).disabledColor),
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
                          child: Text(
                            AppLocalizations.of(context)!.logIn,
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
                          AppLocalizations.of(context)!.forgotPassword,
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
                              text: AppLocalizations.of(context)!.agreeWith,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Заглушка'),
                                  text: AppLocalizations.of(context)!.rules,
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
                              AppLocalizations.of(context)!.signUp,
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
        });
  }

  void registrationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, locale) {
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
                      Text(
                        AppLocalizations.of(context)!.signUp,
                      ),
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
                                      child:
                                          Image.asset('lib/images/apple.png'),
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
                                    child:
                                        Image.asset('lib/images/google.png')),
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: 7, right: 7, bottom: 4),
                            child: Text(
                              AppLocalizations.of(context)!.enterEmail,
                            ),
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
                            hintText: AppLocalizations.of(context)!.email,
                            hintStyle: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                          cursorColor: Colors.grey.shade400),
                      TextField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            hintStyle: TextStyle(
                                color: Theme.of(context).disabledColor),
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
                        AppLocalizations.of(context)!.validation,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      UserAcceptWidget(
                        mainText: AppLocalizations.of(context)!.agreeWith,
                        underlineText: AppLocalizations.of(context)!.rules,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      UserAcceptWidget(
                        mainText: AppLocalizations.of(context)!.commercialInfo,
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
                          child: Text(
                            AppLocalizations.of(context)!.makeAccount,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
