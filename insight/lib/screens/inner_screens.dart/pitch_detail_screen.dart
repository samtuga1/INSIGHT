import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';

class PitchDetailScreen extends StatelessWidget {
  static const routeName = '/pitch_detail';
  const PitchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: theme.accentColor,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.star),
            onPressed: () {},
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
                      'Revolutionalizing fintech',
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
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/agric.jpeg',
                  fit: BoxFit.cover,
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
                    onTap: () {},
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
                      'GH₵ 1200',
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
                      'Fintech',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis elit proin nibh libero sollicitudin velit. Donec nulla quam nibh in blandit orci, pretium.  elit proin nibh libero sollicitudin velit. Donec nulla quam nibh in blandit orci, pretiu',
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
