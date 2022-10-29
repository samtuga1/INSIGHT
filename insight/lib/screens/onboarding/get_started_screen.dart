import 'package:flutter/material.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/screens/onboarding/sign_up_screen.dart';
import '../../widgets/status_container.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  String userStatus = '';
  int selected = 3;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 133, 23, 0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Get Started Now',
                style: theme.textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'It\'s free to join and gain full access to thousands of exciting investment opportunities',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 36,
            ),
            ...List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: UserStatusContainer(
                  selected: selected,
                  theme: theme,
                  imageUrl: index == 0
                      ? 'assets/images/money.png'
                      : 'assets/images/person.png',
                  label: index == 0
                      ? 'I\'m an investor, looking to invest'
                      : 'I\'m an entrepreneur, looking for funds ',
                  onTap: index == 0
                      ? () => setState(() {
                            selected = 0;
                            userStatus = 'investor';
                          })
                      : () => setState(() {
                            selected = 1;
                            userStatus = 'business_owner';
                          }),
                  index: index,
                ),
              ),
            ),
            const SizedBox(
              height: 110,
            ),
            GlobalMethods.materialButton(
              onPressed: () => Navigator.of(context).pushNamed(
                SignUpScreen.routeName,
              ),
              child: 'SIGN UP',
              theme: theme,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: theme.textTheme.bodyText1),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: theme.textTheme.bodyText1
                        ?.copyWith(color: theme.primaryColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
