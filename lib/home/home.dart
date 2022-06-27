import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/admin/ui/admin_home.dart';
import 'package:mystore/catalog/bloc/catalog_bloc.dart';
import 'package:mystore/home/constants.dart';


import '../catalog/models/catalogmodel.dart';
import '../catalog/ui/catalog_page.dart';
import '../category/view/ProductCard.dart';
import '../category/view/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius2 =
        BorderRadius.all(Radius.circular(defaultBorderRadius));
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius2,
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icon/menu.svg"),
          ),
          title: Row(
            children: [
              SvgPicture.asset("assets/icon/Location.svg"),
              const SizedBox(width: defaultPadding / 2),
              Text(
                "15/2 New Texas",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                       MaterialPageRoute(
                        builder: (context) => AdminHome())
                    );
              },
            ),
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "best Outfits for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const Categories(),
            const SizedBox(
              height: defaultPadding,
            ),
            const SectionTitle(),
            const Products(),
          ],
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogLoadedState) {
                return Row(
                  children: List.generate(
                    state.catalogs.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        title: state.catalogs[index].title.toString(),
                        image: "assets/images/product_0.png",
                        price: 500,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CatalogPage()));
                        },
                      ),
                    ),
                  ),
                );
              }
              return const Text("somethinf wrong");
            },
          ),
        )
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("New Arrial",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
        TextButton(
            onPressed: () {},
            child: const Text(
              "See all",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search items...",
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset("assets/icon/Search.svg"),
                ),
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultBorderRadius)))),
                      child: SvgPicture.asset("assets/icon/Filter.svg"),
                    ),
                  ),
                ))));
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
