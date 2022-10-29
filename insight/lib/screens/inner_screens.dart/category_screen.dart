import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/models/category_model.dart';
import 'package:insight/providers/categories_provider.dart';
import 'package:insight/screens/outer_screens.dart/add_pitch.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    final categories = Provider.of<CategoryProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          color: const Color(0xff769AF2),
          child: Text(
            'All categories',
            style: theme.textTheme.headline1?.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
          physics: GlobalMethods.scrollPhysics(isIos),
          itemCount: categories.categories.length,
          itemBuilder: (context, index) => Material(
            child: ListTile(
              onTap: () {
                categories.setCategory(categories.categories[index]);
                Navigator.of(context).pop(true);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(categories.categories[index].imageUrl!),
                ),
              ),
              title: Text(
                categories.categories[index].title!,
                style: theme.textTheme.bodyText1,
              ),
              trailing: const Icon(CupertinoIcons.chevron_forward),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.7,
          ),
        ))
      ],
    );
  }
}
