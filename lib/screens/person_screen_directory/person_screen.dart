import 'package:flutter/material.dart';

import 'package:flutter_shop_app/widgets/person_screen_widgets/expansion_tile.dart';

class PersonScreen extends StatelessWidget {

  static const String routeName = '/personScreen';

  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:
            Text('Мій акаунт', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14,right: 14),
            child: Column(
              children: [
                TextButton(
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
                const SizedBox(
                  height: 10,
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
                const SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionTileWidget(
                        categoryName: 'Налаштування',
                        icon: Icons.settings,
                        detailsWidget: SettingsWidget(),
                      ),
                      ExpansionTileWidget(
                        categoryName: 'Корисна інформація',
                        icon: Icons.info_outline,
                        detailsWidget: InformationWidget(),
                      ),
                      ExpansionTileWidget(
                        categoryName: 'Контактна інформація',
                        icon: Icons.phone,
                        detailsWidget: ContactsInformationWidget(),
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
  }
}
