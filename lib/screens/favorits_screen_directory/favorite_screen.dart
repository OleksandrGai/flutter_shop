import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';
import 'package:flutter_shop_app/widgets/favorite_screen_widgets/alert_dialogs_widget.dart';

import '../../model/products_data.dart';
import '../../state_management/bloc_favorite_screen/bloc_favorite_screen.dart';
import '../../widgets/home_screen_widgets/products_details.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favoriteScreen';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, locale) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.favorite,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
            builder: (context, state) {
              if (state.favoriteList.isEmpty) {
                return SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 100, bottom: 20),
                              child: Text(
                                  AppLocalizations.of(context)!.bookmark,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                  AppLocalizations.of(context)!.addProducts,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                            ),
                            Text(AppLocalizations.of(context)!.haveAccount,
                                style: Theme.of(context).textTheme.titleLarge),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .logInFavouriteScreen,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    ModalDialog().loginDialog(context);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  child: Text(
                                      AppLocalizations.of(context)!.logIn,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ),
                              ),
                            ),
                            Text(AppLocalizations.of(context)!.noAccount,
                                style: Theme.of(context).textTheme.titleLarge),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .advantageOfSpecialOffers,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  ModalDialog().registrationDialog(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
                                    AppLocalizations.of(context)!.signUp,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 14, right: 14),
                  child: ListView.builder(
                    itemCount: state.favoriteList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductsDetails.routeName,
                            arguments: Product(
                              id: state.favoriteList[index].id,
                              description:
                                  state.favoriteList[index].description,
                              image: state.favoriteList[index].image,
                              title: state.favoriteList[index].title,
                              price:
                                  '${state.favoriteList[index].price.toString()}\$',
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Row(
                                children: [
                                  Image.network(
                                      height: 140,
                                      width: 130,
                                      fit: BoxFit.fitHeight,
                                      state.favoriteList[index].image),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            state.favoriteList[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                            softWrap: false,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                              state.favoriteList[index].price,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .size,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .color,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                              'Id: ${state.favoriteList[index].id.toString()}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.shopping_basket_outlined),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                onPressed: () {
                                  context.read<FavoriteScreenBloc>().add(
                                      RemoveProduct(
                                          product: state.favoriteList[index]));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              AppLocalizations.of(context)!
                                                  .removeFromFavorite),
                                          duration:
                                              const Duration(seconds: 1)));
                                },
                                icon: const Icon(Icons.close_outlined),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
