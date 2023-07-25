import 'package:flutter/material.dart';

class BrandsGridWidget extends StatelessWidget {
  const BrandsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 3, mainAxisSpacing: 3),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text('Some brand'),
              ),
            );
            // );
          }),
    );
  }
}
