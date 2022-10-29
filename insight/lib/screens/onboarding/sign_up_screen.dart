import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insight/screens/bottom_navigation.dart';

import '../../consts/global_methods.dart';
import '../../widgets/text_form_box.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? imageUrl;

  final formKey = GlobalKey<FormState>();
  bool rememberMeStat = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              physics: isIos
                  ? const BouncingScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 133,
                      ),
                      Text(
                        'Let\'s sign you up',
                        style: theme.textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      TextFormBox(
                        theme: theme,
                        onChanged: (String value) {},
                        controller: nameController,
                        labelText: 'Full Name',
                        prefixIcon: 'assets/images/person-icon.png',
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Your name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextFormBox(
                        theme: theme,
                        onChanged: (String value) {},
                        controller: emailController,
                        labelText: 'Enter email here',
                        prefixIcon: 'assets/images/email.png',
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Your email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextFormBox(
                        controller: passwordController,
                        theme: theme,
                        onChanged: (String value) {},
                        labelText: 'Enter your password',
                        prefixIcon: 'assets/images/lock-icon.png',
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Your password is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Please enter 8 or more characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Switch.adaptive(
                                  activeColor: theme.primaryColor,
                                  value: rememberMeStat,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMeStat = value;
                                    });
                                  }),
                              Text(
                                'Remember Me',
                                style: theme.textTheme.bodyText1,
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: theme.textTheme.bodyText1?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 49,
                      ),
                      loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GlobalMethods.materialButton(
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                Timer(
                                    const Duration(milliseconds: 1000),
                                    () => {
                                          setState(() {
                                            loading = false;
                                          }),
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                            NavigationScreen.routeName,
                                            (route) => false,
                                          )
                                        });
                              },
                              theme: theme,
                              child: 'Create my account',
                            ),
                      const SizedBox(
                        height: 34,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
