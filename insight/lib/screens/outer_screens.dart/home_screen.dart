import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/models/category_model.dart';
import 'package:insight/models/pitch_model.dart';
import 'package:insight/providers/pitches_provider.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/categories_provider.dart';
import '../../providers/user_provider.dart';
import 'add_pitch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String catSelected = '';
  List<PitchModel> filteredPitches = [];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final categories = Provider.of<CategoryProvider>(context, listen: false);
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 25,
            ),
            title: Text(
              'Welcome back,',
              style: theme.textTheme.bodyText1,
            ),
            subtitle: Text(
              user.user.name == '' ? 'Samuel' : user.user.name ?? 'Samuel',
              style: theme.textTheme.headline1,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              physics: GlobalMethods.scrollPhysics(isIos),
              scrollDirection: Axis.horizontal,
              itemCount: categories.categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() {
                  catSelected = categories.categories[index].title!;
                  filteredPitches = user.pitches
                      .where(
                        (pitch) => pitch.category.title == catSelected,
                      )
                      .toList();
                }),
                child: Chip(
                  avatar: Image.asset(
                    categories.categories[index].imageUrl!,
                    color: catSelected == categories.categories[index].title!
                        ? null
                        : Colors.black,
                  ),
                  backgroundColor:
                      catSelected == categories.categories[index].title!
                          ? const Color(0xff769AF2)
                          : null,
                  label: Text(
                    categories.categories[index].title!.toString(),
                  ),
                  labelStyle: TextStyle(
                    color: catSelected == categories.categories[index].title!
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Featured',
            style: theme.textTheme.headline1?.copyWith(fontSize: 20),
          ),
          if (filteredPitches.isEmpty && catSelected == '')
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => UserPitch(
                  title: user.pitches[index].title,
                  description: user.pitches[index].description,
                  categoryModel: user.pitches[index].category,
                  imageUrl: user.pitches[index].imageUrl,
                  amount: user.pitches[index].estimatedAmount,
                  theme: theme,
                  onTap: () => Navigator.of(context).pushNamed(
                    PitchDetailScreen.routeName,
                    arguments: user.pitches[index].id,
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: user.pitches.length,
              ),
            ),
          if (filteredPitches.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => UserPitch(
                  title: filteredPitches[index].title,
                  description: filteredPitches[index].description,
                  categoryModel: filteredPitches[index].category,
                  imageUrl: filteredPitches[index].imageUrl,
                  amount: filteredPitches[index].estimatedAmount,
                  theme: theme,
                  onTap: () => Navigator.of(context).pushNamed(
                    PitchDetailScreen.routeName,
                    arguments: filteredPitches[index].id,
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: filteredPitches.length,
              ),
            ),
          if (filteredPitches.isEmpty && catSelected != '')
            Expanded(
              child: Lottie.asset('assets/empty.zip'),
            ),
        ],
      ),
    );
  }
}

class UserPitch extends StatelessWidget {
  const UserPitch({
    Key? key,
    required this.theme,
    required this.onTap,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.categoryModel,
    required this.amount,
  }) : super(key: key);

  final ThemeData theme;
  final VoidCallback onTap;
  final String title;
  final String description;
  final dynamic imageUrl;
  final CategoryModel categoryModel;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 11,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 153,
            width: double.infinity,
            decoration: BoxDecoration(
              image: imageUrl is String
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageUrl),
                    )
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        imageUrl,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: theme.textTheme.headline1
              ?.copyWith(fontSize: 20, color: Colors.black),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/ping.png',
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Ghana',
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: theme.textTheme.bodyText1,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GHS ${amount.toString()}',
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: const Color(0xff3D56F0),
                  ),
                ),
                Text(
                  'Estimate',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                height: 46,
                width: 132,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color(0xff5669FF),
                ),
                child: Text(
                  'Read more',
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
