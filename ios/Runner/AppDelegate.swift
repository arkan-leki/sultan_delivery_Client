import UIKit
import Flutter
import GoogleMaps // Google map

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyCAw4EUYqfXxoKVBrGsbbtI8BgEY_mTQpM")  // google map
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

