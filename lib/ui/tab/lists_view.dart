import 'package:flutter/material.dart';

class ListsView extends StatelessWidget {
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "横のスクロールリスト",
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => _Card(),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          )
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: 200,
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          Text(
            "タイトル",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "説明文",
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
