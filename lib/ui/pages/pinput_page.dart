import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';

class PinputPage extends HookWidget {
  const PinputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(title: const Text('Pinput Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_PinputField(controller: controller, focusNode: focusNode)],
      ),
    );
  }
}

class _PinputField extends StatelessWidget {
  const _PinputField({required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      animationCurve: Curves.linear,
      animationDuration: const Duration(milliseconds: 50),
      defaultPinTheme: PinTheme(
        width: 40,
        height: 60,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onCompleted: (value) {
        print('Completed: $value');
      },
    );
  }
}
