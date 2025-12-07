import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/ui/dialog/modal_dialog.dart';
import 'package:ikenie_flutter/ui/router/router_setting.dart';
import 'package:linkify/linkify.dart';
import 'package:pinput/pinput.dart';

class TextView extends HookWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.requestFocus();
      });
    });
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectableCopyText(
            "ああああああ 111111 aaaaaaa ###### \n https://google.com",
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter your username'),
          ),
          const SizedBox(height: 20),
          const Text("拡大表示実験用", style: TextStyle(fontSize: 30)),
          const SizedBox(height: 4),
          const Text("適当な文字など入れてみる"), //, style: TextStyle(fontSize: 12)),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              ModalDialog.show(context);
            },
            child: const Text('Tap me'),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              var i = 0;
              while (i <= 10) {
                print(i);
                i++;
              }
              print("for loop");
              for (var i = 0; i <= 10; i++) {
                print(i);
              }
            },
            child: const Text('print log'),
          ),
          TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(hintText: 'Enter your username'),
           ),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.pinput_page.name);
            },
            child: Text("テキストフィールドを確認"),
          ),
          ElevatedButton(
            onPressed: () {
              void _showErrorDialog(BuildContext context, String message) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('エラー'),
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                );
              }

              _showErrorDialog(context, "エラーメッセージ");
            },
            child: Text("投稿"),
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
      linkifiers: const [UrlLinkifier(), EmailLinkifier()],
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
