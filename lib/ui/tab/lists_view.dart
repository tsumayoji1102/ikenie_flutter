import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class ListsView extends HookWidget {
  ListsView({super.key});

  final Map<String, List<String>> categories = {
    '果物': ['りんご', 'バナナ', 'オレンジ'],
    '野菜': ['にんじん', 'レタス', 'トマト'],
    '飲み物': ['水', 'お茶', 'コーヒー'],
  };

  @override
  Widget build(BuildContext context) {
    final assets = useState<List<AssetEntity>>([]);
    final selectedAssets = useState<List<AssetEntity>>([]);
    useEffect(() {
      Future.microtask(() async {
        assets.value = await get();
        print("assets.value: ${assets.value}");
      });
      return null;
    }, []);
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
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              const platform = MethodChannel('photo_manager');
              final assetIds =
                  await platform.invokeMethod('select_photo') ?? <String>[];
              print("select_photo: $assetIds");
              final newSelectedAssets = <AssetEntity>[];
              for (final assetId in assetIds) {
                final asset = await AssetEntity.fromId(assetId);
                if (asset == null) continue;
                newSelectedAssets.add(asset);
              }
              selectedAssets.value = newSelectedAssets;
            },
            child: const Text(
              "ライブラリを表示",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: assets.value.length,
              itemBuilder: (context, index) {
                final asset = assets.value[index];
                final isSelected = selectedAssets.value.contains(asset);
                return _GridPhoto(
                  asset: asset,
                  isSelected: isSelected,
                  onTap: (isSelected) {
                    final newSelectedAssets = selectedAssets.value;
                    if (isSelected) {
                      newSelectedAssets.remove(asset);
                    } else {
                      newSelectedAssets.add(asset);
                    }
                    selectedAssets.value = newSelectedAssets;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<AssetEntity>> get() async {
    final result = await PhotoManager.requestPermissionExtend();
    final asset = await PhotoManager.getAssetListRange(start: 0, end: 10);
    return asset;
  }
}

class _GridPhoto extends HookWidget {
  const _GridPhoto({
    required this.asset,
    required this.isSelected,
    required this.onTap,
  });

  final AssetEntity asset;
  final bool isSelected;
  final Function(bool isSelected) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelectedState = useState(isSelected);
    useEffect(() {
      isSelectedState.value = isSelected;
      return null;
    }, [isSelected]);
    return GestureDetector(
      onTap: () {
        isSelectedState.value = !isSelectedState.value;
        onTap(isSelectedState.value);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          AssetEntityImage(
            asset,
            thumbnailSize: const ThumbnailSize(200, 200),
            fit: BoxFit.cover,
          ),
          if (isSelectedState.value)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
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
          // Expanded(
          //     child: GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5,
          //   ),
          //   itemCount: 4,
          //   itemBuilder: (context, index) => Container(
          //     color: Colors.blue,
          //     child: Center(
          //       child: Text('Item $index'),
          //     ),
          //   ),
          // )),
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
