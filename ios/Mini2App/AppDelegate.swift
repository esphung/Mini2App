//
//  AppDelegate.swift
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

import Foundation
import DJISDK

//DJISDKManagerDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
//  //  TODO: Move to VC
//  func appRegisteredWithError(_ error: Error?) {
//      var message = "Register App Succeeded!"
//      if error != nil {
//          message = "DJISDK Register App Failed! Please enter your App Key in the plist file and check the network."
//          print(message)
//      } else {
//          print("DJISDK registerAppSuccess: \(message)")
//      }
//  }
//
//  //  TODO: Move to VC
//  func didUpdateDatabaseDownloadProgress(_ progress: Progress) {
//    print(progress)
//  }
//  //  TODO: Move to VC
//  func registerApp() {
//      DJISDKManager.registerApp(with: self)
//  }

  var window: UIWindow?

  var bridge: RCTBridge!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    // TODO: Passed props to react native
    let imageList = [
      "https://upload.wikimedia.org/wikipedia/en/9/95/Test_image.jpg",
      "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc="
    ]

    let props = [
        "images": imageList
    ]

    let jsCodeLocation: URL
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(
      forBundleRoot: "index",
      fallbackExtension: "jsbundle"
    )

    let rootView = RCTRootView(
      bundleURL: jsCodeLocation,
      moduleName: "Mini2App",
      initialProperties: props, // passing props to react native app
      launchOptions: launchOptions
    )

    let rootViewController = UIViewController()
    rootViewController.view = rootView;

    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = rootViewController
    self.window?.makeKeyAndVisible();
    
    //  TODO: Call from React Native
    // registerApp()

    return true
  }
}

