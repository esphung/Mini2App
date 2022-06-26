//
//  SwiftComponentManager.swift
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

import DJISDK

@objc(SwiftComponentManager)
class SwiftComponentManager: NSObject, DJISDKManagerDelegate {

  // Test function for RN call
  @objc func passValueFromReact(_ value : String) {
    debugPrint("Print Here: \(value)")
  }
  
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

}
