import 'package:flutter/material.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';

class PitchesScreen extends StatelessWidget {
  const PitchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => PitchContainer(
                theme: theme,
                onTap: () => Navigator.of(context).pushNamed(
                  PitchDetailScreen.routeName,
                ),
              ),
            ),
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
  }) : super(key: key);

  final ThemeData theme;
  final VoidCallback onTap;

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
                child: Image.asset(
                  'assets/images/agric.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Header',
            style: theme.textTheme.headline1?.copyWith(fontSize: 16),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis elit proin nibh libero sollicitudin velit. Donec nulla quam nibh in blandit orci, pretium',
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
