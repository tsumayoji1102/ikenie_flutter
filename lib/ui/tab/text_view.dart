import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SelectableCopyText(
              "ああああああ 111111 aaaaaaa ###### \n https://google.com"),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your username',
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableCopyText extends StatelessWidget {
  const SelectableCopyText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textElements = linkify(
      text,
      linkifiers: const [
        UrlLinkifier(),
        EmailLinkifier(),
      ],
    );

    return SelectableText.rich(
      TextSpan(
        children: textElements.map((element) {
          return element is LinkableElement
              ? TextSpan(
                  text: element.text,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => handleTapLink(element),
                )
              : TextSpan(
                  text: element.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                );
        }).toList(),
      ),
      selectionHeightStyle: BoxHeightStyle.max,
    );
  }

  void handleTapLink(LinkableElement element) {
    print('Tapped: ${element.text}');
  }
}
