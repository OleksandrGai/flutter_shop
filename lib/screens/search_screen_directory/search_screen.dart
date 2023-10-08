import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/products_data.dart';
import '../../networking/products_api.dart';
import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';
import '../../widgets/search_screen_widgets/text_field_search_screen.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/searchScreen';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WomanTab>(create: (_) => WomanTab(ProductsApi())),
          BlocProvider<ManTab>(create: (_) => ManTab(ProductsApi())),
        ],
        child: BlocBuilder<WomanTab, TabBarInitialState>(
            builder: (womanContext, womanState) {
          return BlocBuilder<ManTab, TabBarInitialState>(
              builder: (manContext, manState) {
            return Builder(
              builder: (BuildContext context) {
                return Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: TextField(
                              onChanged: (value) {
                                context
                                    .read<WomanTab>()
                                    .add(FilterEvent(enteredString: value));
                                context
                                    .read<ManTab>()
                                    .add(FilterEvent(enteredString: value));
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusColor,
                                ),
                                suffix: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Анулювати',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .unselectedWidgetColor,
                                    ),
                                  ),
                                ),
                              ),
                              cursorColor: Colors.grey.shade400),
                        ),
                        TabBar(
                          dividerColor: Theme.of(context).unselectedWidgetColor,
                          labelColor: Theme.of(context).primaryColor,
                          tabs: tabs,
                          indicatorColor:
                              Theme.of(context).unselectedWidgetColor,
                          onTap: (int tabIndex) {},
                        ),
                        SizedBox(
                          height: 650,
                          child: TabBarView(
                            children: [
                              womanProduct(womanContext),
                              manProduct(manContext),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          });
        }),
      ),
    );
  }
}

Widget womanProduct(BuildContext context) {
  if (DefaultTabController.of(context).index == 0) {
    return BlocBuilder<WomanTab, TabBarInitialState>(builder: (context, state)  {

    //  context.read<WomanTab>().add(WomanTabBarEvent());

      return ProductGrid(product: state.categoryProducts);
    });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget manProduct(
  BuildContext context,
) {
  if (DefaultTabController.of(context).index == 1) {
    return BlocBuilder<ManTab, TabBarInitialState>(builder: (context, state) {
     // context.read<ManTab>().add(ManTabBarEvent());

      return ProductGrid(product: state.categoryProducts);
    });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

List<Widget> tabs = const [
  Tab(text: 'Вона'),
  Tab(text: 'Він'),
];

/*
// TODO: Normal function without filter event
Widget womanProduct(
  BuildContext context,
) {
  if (DefaultTabController.of(context).index == 0) {

    return BlocBuilder<WomanTab, TabBarState>(builder: (context, state) {
      context.read<WomanTab>().add(ConsumerTabBarEvent());

      return ProductGrid(product: state.categoryProducts);
    });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget manProduct(
  BuildContext context,
) {
  if (DefaultTabController.of(context).index == 1) {
  //  print(DefaultTabController.of(context).index);
    return BlocBuilder<ManTab, TabBarState>(builder: (context, state) {
      context.read<ManTab>().add(ConsumerTabBarEvent());
      return ProductGrid(product: state.categoryProducts);
    });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
 */

/*
//TODO: easy builder
Builder(
                      builder: (BuildContext context) {
                        return Scaffold(
                          body: SafeArea(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  child: TextField(
                                      onChanged: (value) {
                                        context
                                            .read<WomanTab>()
                                            .add(
                                            FilterEvent(enteredString: value));
                                        // context
                                        //     .read<ManTab>()
                                        //     .add(FilterEvent(enteredString: value));
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                          color: Theme
                                              .of(context)
                                              .inputDecorationTheme
                                              .focusColor,
                                        ),
                                        suffix: TextButton(
                                          child: Text(
                                            'Анулювати',
                                            style: TextStyle(
                                              color: Theme
                                                  .of(context)
                                                  .unselectedWidgetColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            //   _searchController.clear();
                                          },
                                        ),
                                      ),
                                      cursorColor: Colors.grey.shade400),
                                ),
                                TabBar(
                                  dividerColor: Theme
                                      .of(context)
                                      .unselectedWidgetColor,
                                  labelColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  tabs: tabs,
                                  indicatorColor:
                                  Theme
                                      .of(context)
                                      .unselectedWidgetColor,
                                  onTap: (int tabIndex) {},
                                ),
                                SizedBox(
                                  height: 650,
                                  child: TabBarView(
                                    children: [
                                      womanProduct(
                                          womanContext,
                                          womanState.categoryProducts),
                                      manProduct(manContext,
                                          manState.categoryProducts),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
 */

/*
//TODO: test widget
class TestStateWidget extends StatelessWidget {
  TestStateWidget(
      {super.key, required this.product, required this.womanContext, required this.manContext});

  List<Product> product;
  BuildContext womanContext;
  BuildContext manContext;

  @override
  Widget build(BuildContext context) {
    return Builder(

        builder: (BuildContext context) {
          {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: TextField(
                          onChanged: (value) {
                            context
                                .read<WomanTab>()
                                .add(FilterEvent(enteredString: value));
                            // context
                            //     .read<ManTab>()
                            //     .add(FilterEvent(enteredString: value));
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: Theme
                                  .of(context)
                                  .inputDecorationTheme
                                  .focusColor,
                            ),
                            suffix: TextButton(
                              child: Text(
                                'Анулювати',
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .unselectedWidgetColor,
                                ),
                              ),
                              onPressed: () {
                                //   _searchController.clear();
                              },
                            ),
                          ),
                          cursorColor: Colors.grey.shade400),
                    ),
                    TabBar(
                      dividerColor: Theme
                          .of(context)
                          .unselectedWidgetColor,
                      labelColor: Theme
                          .of(context)
                          .primaryColor,
                      tabs: tabs,
                      indicatorColor: Theme
                          .of(context)
                          .unselectedWidgetColor,
                      onTap: (int tabIndex) {},
                    ),
                    SizedBox(
                      height: 650,
                      child: TabBarView(
                        children: [
                          womanProduct(womanContext, product),
                          manProduct(manContext, product),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
  }
 */
