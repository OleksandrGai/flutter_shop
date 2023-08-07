import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/state_management/bloc_theme/bloc_theme.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.categoryName,
    required this.icon,
    required this.detailsWidget,
  });

  final String categoryName;
  final IconData icon;
  final Widget detailsWidget;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: Theme.of(context).focusColor,
      iconColor: Theme.of(context).focusColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(categoryName),
          ),
        ],
      ),
      children: [
        detailsWidget,
      ],
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Темна тема',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              height: 60,
              width: 70,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                    activeColor: Theme.of(context).focusColor,
                    value: context.select((SwitchThemeBloc blocTheme) =>
                        blocTheme.state.switchValue),
                    onChanged: (newValue) {
                      newValue
                          ? context
                              .read<SwitchThemeBloc>()
                              .add(SwitchOnDarkThemeEvent())
                          : context
                              .read<SwitchThemeBloc>()
                              .add(SwitchOffDarkThemeEvent());
                    }),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          children: [
            Text(
              'Локалізація',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              child: Text(
                '🇬🇧',
                style: TextStyle(fontSize: 50),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              child: Text(
                '🇺🇦',
                style: TextStyle(fontSize: 50),
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 17),
          child: Text(
            'Правила магазину',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 17),
          child: Text(
            'Про магазин',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 17),
          child: Text(
            'Про додаток',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}

class ContactsInformationWidget extends StatelessWidget {
  const ContactsInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 17),
          child: Text(
            'Телефон',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 17),
          child: Text(
            'Адреса',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          width: 30,
        ),


      ],
    );
  }
}
