import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/widgets/message_box.dart';

class MessageScreen extends StatelessWidget {
  static const routeName = '/message_screen';
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        itemCount: 20,
                        itemBuilder: (context, index) => Align(
                          alignment: index % 2 == 0
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xff5669FF),
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(index % 2 == 0 ? 10 : 0),
                                bottomRight:
                                    Radius.circular(index % 2 == 0 ? 0 : 10),
                                topLeft: const Radius.circular(10),
                                topRight: const Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Whatsap',
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
              const MessageBox(),
            ],
          ),
        ),
      ),
    );
  }
}
