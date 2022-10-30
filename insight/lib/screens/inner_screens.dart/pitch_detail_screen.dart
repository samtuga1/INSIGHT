import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/enums.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/providers/pitches_provider.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/screens/inner_screens.dart/message_screen.dart';
import 'package:provider/provider.dart';

class PitchDetailScreen extends StatefulWidget {
  static const routeName = '/pitch_detail';
  const PitchDetailScreen({super.key});

  @override
  State<PitchDetailScreen> createState() => _PitchDetailScreenState();
}

class _PitchDetailScreenState extends State<PitchDetailScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    final pitchId = ModalRoute.of(context)?.settings.arguments as dynamic;
    final pitch = Provider.of<User>(context).findById(pitchId);
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: theme.accentColor,
        actions: [
          if (user.user.userStatus == UserStatus.investor)
            IconButton(
              color: isFavorite ? Colors.pink : null,
              icon: const Icon(
                CupertinoIcons.star,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                if (isFavorite) {
                  user.addFavPitch(pitch);
                } else {
                  user.removeFavPitch(pitch);
                }
              },
            ),
        ],
      ),
      body: ListView(
        physics: GlobalMethods.scrollPhysics(isIos),
        children: [
          SizedBox(
            height: 200,
            child: GridTile(
              footer: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pitch.title,
                      style: theme.textTheme.headline1?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ping.png',
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Ghana',
                          style: theme.textTheme.labelMedium
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: pitch.imageUrl is String
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(pitch.imageUrl),
                        )
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            pitch.imageUrl,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(
                2,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MessageScreen.routeName,
                      );
                    },
                    child: Container(
                      margin: index == 0
                          ? const EdgeInsets.only(right: 5)
                          : const EdgeInsets.only(left: 5),
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff769AF2),
                      ),
                      child: Text(
                        index == 0 ? 'Make an offer' : '📞Call',
                        style: theme.textTheme.headline1
                            ?.copyWith(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated amount',
                      style: theme.textTheme.headline1?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'GHS ${pitch.estimatedAmount}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: theme.textTheme.headline1?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      pitch.category.title.toString(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 25,
                  thickness: 0.66,
                ),
                Text(
                  'Description',
                  style: theme.textTheme.headline1?.copyWith(
                    fontSize: 18,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pitch.description,
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 25,
                  thickness: 0.66,
                ),
                Text(
                  'How previous fund was spent',
                  style: theme.textTheme.headline1?.copyWith(
                    fontSize: 18,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pitch.howPreviousMoneySpent.toString(),
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
