import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 45,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: const Icon(CupertinoIcons.add),
              ),
              Expanded(
                child: Material(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: const Icon(CupertinoIcons.camera),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: const Icon(CupertinoIcons.mic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
