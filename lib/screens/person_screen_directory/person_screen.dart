import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/state_management/bloc_theme/bloc_theme.dart';

class PersonScreen extends StatelessWidget {

  static const String routeName = '/personScreen';

  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _productsCategory = [
      'Налаштування',
      'Корисна інформація',
      'Контакти',
    ];
    final List<IconData> _icons = [
     Icons.settings,
      Icons.info,
      Icons.contacts,
    ];
    final List<TextButton> _buttons = [
      TextButton(
          onPressed: () {
            final bloc = context.read<BlocTheme>();
            bloc.add(BlocThemeTabEvent());
          },
          child: const Text('tab')),
      TextButton(
          onPressed: () {
            final bloc = context.read<BlocTheme>();
            bloc.add(BlocThemeTabEvent());
          },
          child: const Text('tab')),
      TextButton(
          onPressed: () {
            final bloc = context.read<BlocTheme>();
            bloc.add(BlocThemeTabEvent());
          },
          child: const Text('tab')),

    ];
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  itemCount: _productsCategory.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      textColor: Theme.of(context).focusColor,
                      iconColor: Theme.of(context).focusColor,
                      title: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Icon(_icons[index]), Text(_productsCategory[index])],),
                      children: [
                        _buttons[index],
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
