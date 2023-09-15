import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';


import 'package:flutter_shop_app/widgets/person_screen_widgets/expansion_tile.dart';

class PersonScreen extends StatelessWidget {

  static const String routeName = '/personScreen';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.transparent,
                        side: BorderSide(
                            color: Theme.of(context).unselectedWidgetColor),
                        maximumSize: const Size(300, 50),
                        minimumSize: const Size(260, 50),
                      ),
                      child: Text(AppLocalizations.of(context)!.logIn,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.transparent,
                        side: BorderSide(
                            color: Theme.of(context).unselectedWidgetColor),
                        maximumSize: const Size(300, 50),
                        minimumSize: const Size(260, 50),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context).textTheme.titleLarge,
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
                            categoryName: AppLocalizations.of(context)!.settings,
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
                            categoryName: AppLocalizations.of(context)!.contacts,
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
