import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'add_pitch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String catSelected = '';
  final List<Map<String, String>> chipsData = [
    {'label': 'Sports', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Educational', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Agriculture', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Technology', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Music', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Food', 'imageUrl': 'assets/images/profile.image'},
    {'label': 'Arts', 'imageUrl': 'assets/images/profile.image'},
  ];
  @override
  Widget build(BuildContext context) {
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
              'Samuel',
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
              itemCount: chipsData.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() {
                  catSelected = chipsData[index]['label']!;
                }),
                child: Chip(
                  backgroundColor: catSelected == chipsData[index]['label']
                      ? const Color(0xff769AF2)
                      : null,
                  label: Text(
                    chipsData[index]['label'].toString(),
                  ),
                  labelStyle: TextStyle(
                    color: catSelected == chipsData[index]['label']
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
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => UserPitch(
                theme: theme,
                onTap: () => Navigator.of(context).pushNamed(
                  PitchDetailScreen.routeName,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 6,
            ),
          )
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
  }) : super(key: key);

  final ThemeData theme;
  final VoidCallback onTap;

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
          child: SizedBox(
            width: double.infinity,
            height: 153,
            child: Image.asset('assets/images/test.png'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Header',
          style: theme.textTheme.headline1
              ?.copyWith(fontSize: 20, color: Colors.black),
        ),
        Row(
          children: [
            Image.asset('assets/images/ping.png'),
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
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis elit proin nibh libero sollicitudin velit. Donec nulla quam nibh in blandit orci, pretium',
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
                  'GHS 10000',
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: const Color(0xff3D56F0),
                  ),
                ),
                Text(
                  'Target',
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
