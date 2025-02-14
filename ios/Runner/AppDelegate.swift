import Flutter
import PhotosUI
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var viewController: FlutterViewController?
  private var flutterResult: FlutterResult!

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
      binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      self.flutterResult = result
      if call.method == "select_photo" {
        print("arguments: \(call.arguments)")
        guard let args = call.arguments as? [String: Any] else {
          result(
            FlutterError(code: "ARGUMENT_ERROR", message: "Arguments is invalid", details: nil))
          return
        }
        self.selectPhoto(args: args)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// MARK: - channel methods
extension AppDelegate {
  private func selectPhoto(args: [String: Any]) {
    let selectedIds = args["selectedIds"] as? [String] ?? []
    let maxCount = args["maxCount"] as? Int ?? 100

    var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
    config.selectionLimit = maxCount
    config.filter = .images
    if #available(iOS 15.0, *) {
      config.selection = .ordered
    }
    config.preselectedAssetIdentifiers = selectedIds

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
    self.flutterResult(identifiers)
  }
}
