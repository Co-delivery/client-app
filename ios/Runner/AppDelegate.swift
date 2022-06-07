import UIKit
import Flutter

@UIApplicationMain@objc class AppDelegate: FlutterAppDelegate {

    var applicationLifeCycleChannel: FlutterBasicMessageChannel!

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        applicationLifeCycleChannel = FlutterBasicMessageChannel(
            name: "applicationLifeCycle",
            binaryMessenger: (window?.rootViewController as! FlutterViewController).binaryMessenger,
            codec: FlutterStringCodec.sharedInstance())
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        applicationLifeCycleChannel.sendMessage("applicationWillTerminate")
        sleep(2);
    }
    // 앱을 다시 화면에 띄웠을 때
//    override func applicationWillEnterForeground(_ application: UIApplication) {
       // applicationLifeCycleChannel.sendMessage("applicationWillEnterForeground")
//    }

    // 앱이 백그라운드로 갔을 때
    //override func applicationDidEnterBackground(_ application: UIApplication) {
        //applicationLifeCycleChannel.sendMessage("applicationDidEnterBackground")
   // }
}
