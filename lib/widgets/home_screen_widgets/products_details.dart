import 'package:flutter/material.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.id,
    required this.description,
  });

  static const String routeName = '/productsDetails';
  final String image;
  final String title;
  final String price;
  final int id;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              image,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.22,
              minChildSize: 0.22,
              maxChildSize: 0.9,
              builder: (context, controller) => Container(
                color: Colors.grey.shade100,
                child: ListView(
                  controller: controller,
                  children: [
                    ScrollableSheet(
                      title: title,
                      price: price,
                      description: description,
                      id: id.toString(),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, top: 10),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              'У кошик',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollableSheet extends StatelessWidget {
  const ScrollableSheet({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.id,
  });

  final String title;
  final String price;
  final String id;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Column(children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: SizedBox(
              height: 3,
              width: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                  ),
                  child: Text(
                    price,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text('Some brand'),
              ),
            ),
          ],
        ),
        ScrollableSheetFullInformation(
          description: description,
          id: id,
        ),
      ]),
    );
  }
}

class ScrollableSheetFullInformation extends StatelessWidget {
  const ScrollableSheetFullInformation({
    super.key,
    required this.description,
    required this.id,
  });

  final String id;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text('Колір: '),
        UserSelectorWidget(
          color: id,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Доступні розміри: '),
        UserSelectorWidget(
          size: id,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Опис товару: '),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
        Text(
          'ID товару: $id',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class UserSelectorWidget extends StatelessWidget {
  const UserSelectorWidget({super.key, this.color, this.size});

  final String? color;
  final String? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 34,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 6, bottom: 6),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () => print({color}),
                      child: Container(
                        color: color != null
                            ? colorSizeCalculator(color!).$1
                            : Colors.transparent,
                        child: GestureDetector(
                          onTap: () => print(size),
                          child: Center(
                            child: Text(
                                style: Theme.of(context).textTheme.titleSmall,
                                '${size != null ? colorSizeCalculator(size!).$2 : ''}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

(Color, String?) colorSizeCalculator(String id) {
  switch (int.parse(id)) {
    case <= 10:
      return (Colors.white, 'S');
    case > 10 && <= 20:
      return (Colors.black, 'M');
    case > 20 && <= 30:
      return (Colors.orange, 'L');
  }
  return (Colors.pink, 'XL');
}
