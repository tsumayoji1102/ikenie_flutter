import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signature/signature.dart';

class PhotosPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final SignatureController _controller = useMemoized(
      () => SignatureController(
        penStrokeWidth: 5,
        penColor: Colors.red,
        exportBackgroundColor: Colors.blue,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('手書き画面'),
          ),
          Signature(
            controller: _controller,
            width: 300,
            height: 300,
            backgroundColor: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
