import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';
import 'package:flutter_shop_app/widgets/favorite_screen_widgets/alert_dialogs_widget.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favoriteScreen';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, locale) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.favorite,
                style: Theme.of(context).textTheme.titleLarge),
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
                        child: Text(AppLocalizations.of(context)!.bookmark,
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(AppLocalizations.of(context)!.addProducts,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.haveAccount,
                          style: Theme.of(context).textTheme.titleLarge),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                            AppLocalizations.of(context)!.logInFavouriteScreen,
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
                            child: Text(AppLocalizations.of(context)!.logIn,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.noAccount,
                          style: Theme.of(context).textTheme.titleLarge),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                            AppLocalizations.of(context)!
                                .advantageOfSpecialOffers,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            ModalDialog().registrationDialog(context);
                          },
                          child:  Text(AppLocalizations.of(context)!.signUp,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
