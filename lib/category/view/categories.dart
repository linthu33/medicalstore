import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/category/view/mytest_page.dart';

import '../../home/constants.dart';
import '../bloc/category_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is CategoryLoadedState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.categorys.length,
              itemBuilder: (context, index) => CategoryCard(
                icon: "assets/icon/dress.svg",
                title: state.categorys[index].maincategory.toString(),
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyTestPage(
                                cid: state.categorys[index].Id.toString(),
                              )));
                },
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: defaultPadding),
            );
          }
          return const Text("Something Wrong");
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
