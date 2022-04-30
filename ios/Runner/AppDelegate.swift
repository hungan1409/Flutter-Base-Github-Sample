import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  let platformChannel = "com.flutter.base.sample/native_channel"
  let getFlavor = "GET_FLAVOR"

  override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      // check and get native data from flutter
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let flutterChannel = FlutterMethodChannel(name: self.platformChannel, binaryMessenger: controller.binaryMessenger)
      flutterChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case self.getFlavor:
              let flavor = Bundle.main.infoDictionary?["App - Flavor"]
              result(flavor)
          default:
              result(FlutterMethodNotImplemented)
              return
          }
      })

      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
