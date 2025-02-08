// import Flutter
// import PhotosUI
// import UIKit

// public class PhotoManagerPlugin: NSObject, FlutterPlugin {
//     private var result: FlutterResult?
//     private var viewController: UIViewController?

//     public static func register(with registrar: FlutterPluginRegistrar) {
//         let channel = FlutterMethodChannel(
//             name: "photo_manager", binaryMessenger: registrar.messenger())
//         let instance = PhotoManagerPlugin()
//         registrar.addMethodCallDelegate(instance, channel: channel)
//         instance.viewController = UIApplication.shared.keyWindow?.rootViewController
//     }

//     public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//         self.result = result
//         print("call.method: \(call.method)")
//         if call.method == "select_photo" {
//             selectPhoto()
//         } else {
//             print("Not implemented aaaaa")
//             result(FlutterMethodNotImplemented)
//         }
//     }

//     func selectPhoto() {
//         var config = PHPickerConfiguration()
//         config.selectionLimit = 10  // 1枚選択。複数の場合は0以上の数値
//         config.filter = .images  // 画像のみ

//         // PHAssetを取得できるように設定
//         config.preselectedAssetIdentifiers = []

//         let picker = PHPickerViewController(configuration: config)
//         picker.delegate = self
//         viewController?.present(picker, animated: true)
//     }
// }

// // MARK: - PhotoManager
// extension PhotoManagerPlugin: PHPickerViewControllerDelegate {
//     public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult])
//     {
//         picker.dismiss(animated: true)

//         var assetIds: [String] = []
//         for result in results {
//             if let assetId = result.assetIdentifier {
//                 print("assetId: \(assetId)")
//                 assetIds.append(assetId)
//             }
//         }
//         self.result?(assetIds)
//     }

// }
