//
//  SwiftComponentManager.swift
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

import DJISDK
import Foundation

@objc(SwiftComponentManager)
class SwiftComponentManager: NSObject, DJISDKManagerDelegate {
  
  var registered: Bool = false;
  var message: String = "";

  // Test function for RN call
  @objc func passValueFromReact(_ value : String) {
    debugPrint("passValueFromReact!: \(value)")
  }
  
  //  TODO: Move to VC
  func appRegisteredWithError(_ error: Error?) {
    message = "Register App Succeeded!"

    if error != nil {
      message = "DJISDK Register App Failed! Please enter your App Key in the plist file and check the network."
      print(message)
      registered = false

    } else {
      message = "DJISDK registerAppSuccess: \(message)"
      print(message)
      registered = true
    }
  }

  //  TODO: Move to VC
  func didUpdateDatabaseDownloadProgress(_ progress: Progress) {
    print("Progress:  \(progress)")
  }
  //  TODO: Move to VC
  @objc func registerApp(_ callback: RCTResponseSenderBlock) -> Void {
      DJISDKManager.registerApp(with: self)

      var responseDict = Dictionary<String, Any>()
      responseDict["success"] = registered
      responseDict["message"] = message // registered == true ? "App registered" : "App failed to register"

      callback([NSNull(), responseDict])
  }
  
  @objc func onLoginClick(_ callback: RCTResponseSenderBlock) {
    var result = Dictionary<String, Any>()
    DJISDKManager.userAccountManager().logIntoDJIUserAccount(withAuthorizationRequired: false) { state, error in
      if let error = error {
        // ShowResult("Login error: %@", error.description)
        result["success"] = false
        result["message"] = error
        
      } else {
        // ShowResult("Login Success")
        result["success"] = false
        result["message"] = "Login Success"
      }
      
    }
    callback([result, NSNull()])
  }

  // Example callback
  @objc func callbackMethod(_ callback: RCTResponseSenderBlock) -> Void {
      let resultsDict = [
        "success" : true
      ];
      callback([NSNull(), resultsDict])
  }
  @objc func simpleMethod(_ message: String!) {
    print("\(String(describing: message))")
  }

}
