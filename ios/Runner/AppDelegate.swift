import Flutter
import PhotosUI
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var viewController: FlutterViewController?
  private var assetIds: [String] = []

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    guard let controller = window?.rootViewController as? FlutterViewController else {
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    viewController = controller
    let methodChannel = FlutterMethodChannel(
      name: "photo_manager",
      binaryMessenger: controller.binaryMessenger)  // ここを修正

    methodChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      print("call.method: \(call.method)")
      if call.method == "select_photo" {
        self.selectPhoto()  // selfを追加
        result(self.assetIds)
      } else {
        print("Not implemented aaaaa")
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 以下は同じ
  func selectPhoto() {
    var config = PHPickerConfiguration()
    config.selectionLimit = 10  // 1枚選択。複数の場合は0以上の数値
    config.filter = .images  // 画像のみ

    // PHAssetを取得できるように設定
    config.preselectedAssetIdentifiers = []

    let picker = PHPickerViewController(configuration: config)
    picker.delegate = self
    viewController?.present(picker, animated: true)
  }
}

// MARK: - PhotoManager
extension AppDelegate: PHPickerViewControllerDelegate {
  public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    picker.dismiss(animated: true)

    let identifiers = results.compactMap { result in
      result.assetIdentifier
    }
    print("identifiers: \(identifiers)")

    // PHAssetを取得
    let assets = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
    print("assetIds: \(assetIds)")
    assets.enumerateObjects { (asset, index, stop) in
      print("Asset ID: \(asset.localIdentifier)")
    }
  }

}
