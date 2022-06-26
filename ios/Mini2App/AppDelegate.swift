//
//  AppDelegate.swift
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

import Foundation
import DJISDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, DJISDKManagerDelegate {
  
  //  TODO: Move to VC
  func appRegisteredWithError(_ error: Error?) {
      var message = "Register App Succeeded!"
      if error != nil {
          message = "DJISDK Register App Failed! Please enter your App Key in the plist file and check the network."
          print(message)
      } else {
          print("DJISDK registerAppSuccess: \(message)")
      }
  }

  //  TODO: Move to VC
  func didUpdateDatabaseDownloadProgress(_ progress: Progress) {
    print(progress)
  }
  //  TODO: Move to VC
  func registerApp() {
      DJISDKManager.registerApp(with: self)
  }

  var window: UIWindow?

  var bridge: RCTBridge!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    let jsCodeLocation: URL
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(
      forBundleRoot: "index",
      fallbackExtension: "jsbundle"
    )

    let rootView = RCTRootView(
      bundleURL: jsCodeLocation,
      moduleName: "Mini2App",
      initialProperties: nil,
      launchOptions: launchOptions
    )

    let rootViewController = UIViewController()
    rootViewController.view = rootView;

    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = rootViewController
    self.window?.makeKeyAndVisible();
    
    //  TODO: Move to VC
    registerApp()

    return true
  }
}

