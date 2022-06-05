import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/category/bloc/category_bloc.dart';

import '../../catalog/bloc/catalog_bloc.dart';
import '../../home/constants.dart';
import 'ProductCard.dart';

class MyTestPage extends StatelessWidget {
  const MyTestPage({Key? key, required this.cid}) : super(key: key);
  final String cid;
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
                          context
                              .read<CatalogBloc>()
                              .add(CatalogLoadIdEvent(Id: cid));
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
