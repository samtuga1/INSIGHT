import 'package:flutter/material.dart';
import 'package:insight/screens/inner_screens.dart/message_screen.dart';
import 'package:insight/widgets/search_bar.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
          child: Text(
            'Chats',
            style: theme.textTheme.headline1?.copyWith(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: SearchBar(theme: theme, onChanged: (value) {}),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                MessageScreen.routeName,
              ),
              leading: const CircleAvatar(),
              title: Text(
                'Samuel',
                style: theme.textTheme.headline1?.copyWith(fontSize: 18),
              ),
              subtitle: Text('Active now', style: theme.textTheme.labelMedium),
              trailing: Column(
                children: [
                  Text('Active now', style: theme.textTheme.labelMedium),
                  Chip(
                    label: Text(
                      '146',
                      style: theme.textTheme.bodyText1
                          ?.copyWith(color: Colors.white),
                    ),
                    backgroundColor: theme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
