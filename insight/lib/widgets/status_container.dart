import 'package:flutter/material.dart';

class UserStatusContainer extends StatelessWidget {
  const UserStatusContainer({
    Key? key,
    required this.theme,
    required this.imageUrl,
    required this.label,
    required this.onTap,
    required this.index,
    required this.selected,
  }) : super(key: key);

  final ThemeData theme;
  final String imageUrl;
  final String label;
  final int index;
  final VoidCallback onTap;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
            width: double.infinity,
            height: 91,
            decoration: BoxDecoration(
              border: Border.all(
                color: selected == index
                    ? theme.primaryColor
                    : const Color(0xffDCDCDC),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: 42,
                  child: Image.asset(imageUrl),
                ),
                Text(
                  label,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 9,
            top: 9,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected == index
                      ? theme.primaryColor
                      : const Color(0xffDCDCDC),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
