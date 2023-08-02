import 'package:flutter/material.dart';

class ContainerProductsListSearchScreen extends StatelessWidget {
  const ContainerProductsListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'lib/images/second.jpeg',
                      height: 110,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Назва продкуту',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text('Ціна', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          }),
    );
  }
}
