import 'package:flutter/material.dart';
import 'package:insight/consts/enums.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class PitchesScreen extends StatelessWidget {
  const PitchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pitches',
            style: theme.textTheme.headline1,
          ),
          Text(
            'View, monitor and improve your pitches',
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 40,
          ),
          if (user.user.userStatus == UserStatus.businessOwner)
            user.pitches.isEmpty
                ? Expanded(
                    child: Lottie.asset('assets/empty.zip'),
                  )
                : Expanded(
                    child: GridView.builder(
                      physics: GlobalMethods.scrollPhysics(isIos),
                      itemCount: user.pitches.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => PitchContainer(
                        title: user.pitches[index].title,
                        imageUrl: user.pitches[index].imageUrl,
                        description: user.pitches[index].description,
                        theme: theme,
                        onTap: () => Navigator.of(context).pushNamed(
                          PitchDetailScreen.routeName,
                          arguments: user.favPitches[index].id,
                        ),
                      ),
                    ),
                  ),
          if (user.user.userStatus == UserStatus.investor)
            user.favPitches.isEmpty
                ? Expanded(
                    child: Lottie.asset('assets/empty.zip'),
                  )
                : Expanded(
                    child: GridView.builder(
                        physics: GlobalMethods.scrollPhysics(isIos),
                        itemCount: user.favPitches.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return PitchContainer(
                            title: user.favPitches[index].title,
                            imageUrl: user.favPitches[index].imageUrl,
                            description: user.favPitches[index].description,
                            theme: theme,
                            onTap: () => Navigator.of(context).pushNamed(
                              PitchDetailScreen.routeName,
                              arguments: user.favPitches[index].id,
                            ),
                          );
                        }),
                  ),
        ],
      ),
    );
  }
}

class PitchContainer extends StatelessWidget {
  const PitchContainer({
    Key? key,
    required this.theme,
    required this.onTap,
    this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  final ThemeData theme;
  final VoidCallback onTap;
  final dynamic imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffDCDCDC),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageUrl is String
                    ? Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(imageUrl),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headline1?.copyWith(fontSize: 16),
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: theme.textTheme.bodyText1?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
