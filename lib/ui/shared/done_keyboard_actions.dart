import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

/// キーボードに「完了」ボタンが表示されるようにする.
///
/// [child] widget for using keyboard actions.
///
/// [focusNodes] 処理するテキストフィールドのfocusNode.複数フィールドに対応.
///
/// [onDone] 完了ボタンタップ時に動かしたい処理.
class DoneKeyboardActions extends StatelessWidget {
  const DoneKeyboardActions({
    super.key,
    required this.child,
    required this.focusNodes,
    this.onDone,
  });

  /// [child] widget for using keyboard actions.
  final Widget child;

  /// [focusNodes] 処理するテキストフィールドのfocusNode.複数フィールドに対応.
  final List<FocusNode> focusNodes;

  /// [onDone] 完了ボタンタップ時に動かしたい処理.
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _keyboardActionsConfig,
      child: child,
    );
  }

  KeyboardActionsConfig get _keyboardActionsConfig {
    return KeyboardActionsConfig(
      defaultDoneWidget: const Text(
        '完了',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      // 複数のテキストフィールド使用してもDoneボタンが適用されるようにする
      actions: focusNodes
          .map(
            (focusNode) => KeyboardActionsItem(
              focusNode: focusNode,
              onTapAction: onDone,
            ),
          )
          .toList(),
    );
  }
}
