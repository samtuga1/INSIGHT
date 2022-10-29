import 'package:flutter/material.dart';
import 'package:insight/models/category_model.dart';
import 'package:insight/screens/inner_screens.dart/category_screen.dart';
import 'package:insight/widgets/text_form_box.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../consts/global_methods.dart';
import '../../providers/categories_provider.dart';

class AddPitchScreen extends StatefulWidget {
  const AddPitchScreen({
    super.key,
  });

  @override
  State<AddPitchScreen> createState() => _AddPitchScreenState();
}

class _AddPitchScreenState extends State<AddPitchScreen> {
  @override
  int hasFundedIndex = -1;
  double amount = 0.0;
  CategoryModel? category;
  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    category = Provider.of<CategoryProvider>(context).category;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          color: const Color(0xff769AF2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
              child: Text(
                'Cancel',
                style: theme.textTheme.bodyText1?.copyWith(color: Colors.white),
              ),
              onPressed: () {},
            ),
            Text(
              'New Pitch',
              style: theme.textTheme.headline1?.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Material(
              color: const Color(0xff769AF2),
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            )
          ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SingleChildScrollView(
              physics: GlobalMethods.scrollPhysics(isIos),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    child: GestureDetector(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => CategoryScreen(),
                        ).then((value) {
                          print(category?.title);
                          setState(() {});
                        });
                      },
                      child: TextFormField(
                        initialValue: category?.title,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 12),
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                          label: Text(
                            'Category',
                            style: theme.textTheme.labelMedium,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff769AF2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add 1 photo for more clarification*',
                    style: theme.textTheme.headline1?.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff769AF2),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextFormBox(
                      theme: theme,
                      validator: (value) {},
                      onChanged: () {},
                      labelText: 'Title',
                    ),
                  ),
                  Text(
                    'We advice that your title must be concise and precise',
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextFormBox(
                      maxLines: 4,
                      theme: theme,
                      validator: (value) {},
                      onChanged: () {},
                      labelText: 'Description',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Have you ever spent money on your startup before?',
                    style: theme.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                      children: List.generate(
                    2,
                    (index) => Expanded(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hasFundedIndex = index;
                              });
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
                                index == 0 ? 'Yes' : 'No',
                                style: theme.textTheme.headline1?.copyWith(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          if (hasFundedIndex == index)
                            const Positioned(
                              top: 7,
                              right: 12,
                              child: CircleAvatar(
                                radius: 5.5,
                                backgroundColor: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  if (hasFundedIndex == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please explain how you spent it',
                          style: theme.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Material(
                          child: TextFormBox(
                            maxLines: 3,
                            theme: theme,
                            validator: (value) {},
                            onChanged: () {},
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextFormBox(
                      textInputType: TextInputType.number,
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 5, right: 9),
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff637381).withOpacity(0.2),
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'GH₵',
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                      theme: theme,
                      validator: (value) {},
                      onChanged: () {},
                      labelText: 'Estimated price',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
