import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class PhotoListPage extends HookWidget {
  const PhotoListPage({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              // final result = await ImagePicker().pickMultiImage();
              // print(result);
              const platform = MethodChannel('photo_manager');
              final assetIds = await platform.invokeMethod('select_photo', {
                    'selectedIds':
                        selectedAssets.value.map((asset) => asset.id).toList(),
                    'maxCount': 100,
                  }) ??
                  [];
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
          )
        ],
      ),
    );
  }

  Future<List<AssetEntity>> get() async {
    final result = await PhotoManager.requestPermissionExtend();
    final asset = await PhotoManager.getAssetListRange(start: 0, end: 100);
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
