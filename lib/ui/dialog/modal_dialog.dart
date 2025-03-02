import 'package:flutter/material.dart';

class ModalDialog extends StatelessWidget {
  const ModalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Title'),
          const SizedBox(height: 20),
          const Text('Message'),
          Container(
            color: Colors.amberAccent,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Container(
            color: Colors.red,
            height: 200,
          )
        ],
      ),
    );
  }

  static Future<void> show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return LayoutBuilder(
            builder: (_, constrains) => SizedBox(
                  height: constrains.maxHeight,
                  child: const ModalDialog(),
                ));
      },
    );
  }
}
