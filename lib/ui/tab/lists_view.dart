import 'package:flutter/material.dart';

class ListsView extends StatelessWidget {
  ListsView({super.key});

  final Map<String, List<String>> categories = {
    '果物': ['りんご', 'バナナ', 'オレンジ'],
    '野菜': ['にんじん', 'レタス', 'トマト'],
    '飲み物': ['水', 'お茶', 'コーヒー'],
  };

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
          ),
          CascadingDropdown(
            items: categories,
            onSelected: (parent, child) {
              print('選択された項目: $parent - $child');
            },
          ),
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

class CascadingDropdown extends StatefulWidget {
  final Map<String, List<String>> items;
  final Function(String, String) onSelected;

  const CascadingDropdown({
    Key? key,
    required this.items,
    required this.onSelected,
  }) : super(key: key);

  @override
  _CascadingDropdownState createState() => _CascadingDropdownState();
}

class _CascadingDropdownState extends State<CascadingDropdown> {
  String? _selectedParent;
  String? _selectedChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: Text('親カテゴリを選択'),
          value: _selectedParent,
          onChanged: (String? newValue) {
            setState(() {
              _selectedParent = newValue;
              _selectedChild = null;
            });
          },
          items:
              widget.items.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        if (_selectedParent != null)
          DropdownButton<String>(
            hint: Text('子カテゴリを選択'),
            value: _selectedChild,
            onChanged: (String? newValue) {
              setState(() {
                _selectedChild = newValue;
              });
              if (_selectedParent != null && newValue != null) {
                widget.onSelected(_selectedParent!, newValue);
              }
            },
            items: widget.items[_selectedParent]
                    ?.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList() ??
                [],
          ),
      ],
    );
  }
}
