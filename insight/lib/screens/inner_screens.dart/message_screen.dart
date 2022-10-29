import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/widgets/message_box.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  static const routeName = '/message_screen';
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> messages = [];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            CupertinoIcons.chevron_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: theme.accentColor,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(),
          title: Text(
            'Samuel',
            style: theme.textTheme.headline1?.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Active now',
            style: theme.textTheme.labelMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/call.png',
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 50),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: GlobalMethods.scrollPhysics(isIos),
                        itemCount: messages.length,
                        itemBuilder: (context, index) => Align(
                          alignment: Alignment.bottomRight,
                          // index % 2 == 0
                          //     ? Alignment.bottomRight
                          //     : Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff5669FF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                // Radius.circular(index % 2 == 0 ? 10 : 0),
                                // bottomRight:
                                //     Radius.circular(index % 2 == 0 ? 0 : 10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              messages[index],
                              style: theme.textTheme.bodyText1?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MessageBox(
                onSubmit: (String value) {
                  setState(() {
                    messages.add(value);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
