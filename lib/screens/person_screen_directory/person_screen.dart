import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';

import 'package:flutter_shop_app/widgets/person_screen_widgets/expansion_tile.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, locale) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.myAccount,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          ModalDialog().loginDialog(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.logIn,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          ModalDialog().registrationDialog(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 14,
                        right: 14,
                        bottom: 10,
                      ),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionTileWidget(
                            categoryName:
                                AppLocalizations.of(context)!.settings,
                            icon: Icons.settings,
                            detailsWidget: const SettingsWidget(),
                          ),
                          ExpansionTileWidget(
                            categoryName:
                                AppLocalizations.of(context)!.usFullInformation,
                            icon: Icons.info_outline,
                            detailsWidget: const InformationWidget(),
                          ),
                          ExpansionTileWidget(
                            categoryName:
                                AppLocalizations.of(context)!.contacts,
                            icon: Icons.phone,
                            detailsWidget: const ContactsInformationWidget(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
