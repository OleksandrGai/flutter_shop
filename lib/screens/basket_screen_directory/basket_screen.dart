import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';
import '../../widgets/favorite_screen_widgets/alert_dialogs_widget.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basketScreen';

  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, locale) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.basket,
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 170, bottom: 20),
                    child: Text(AppLocalizations.of(context)!.emptyBasket,
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(AppLocalizations.of(context)!.letsChose,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Text(AppLocalizations.of(context)!.haveAccount,
                      style: Theme.of(context).textTheme.titleLarge),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(AppLocalizations.of(context)!.loginPlease,
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
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(AppLocalizations.of(context)!.logIn,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
