import 'package:flutter/material.dart';

class ContainerProductsList extends StatelessWidget {
  const ContainerProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 150,
      width: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
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
