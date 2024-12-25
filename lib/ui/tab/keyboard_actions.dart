import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ikenie_flutter/ui/shared/done_keyboard_actions.dart';

class KeyboardActionsView extends HookWidget {
  const KeyboardActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: _TextFieldArea(),
        ),
        Expanded(child: _TextFieldArea())
      ],
    );
  }
}

class _TextFieldArea extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final focusNodes = useMemoized(() => [
          FocusNode(),
          FocusNode(),
        ]);
    return DoneKeyboardActions(
      focusNodes: focusNodes,
      nextFocus: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              focusNode: focusNodes[0],
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: "FirstName"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              focusNode: focusNodes[1],
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Last Name'),
            ),
          ],
        ),
      ),
    );
  }
}
