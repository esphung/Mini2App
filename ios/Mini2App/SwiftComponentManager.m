//
//  SwiftComponentManager.m
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(SwiftComponentManager, NSObject)

  RCT_EXTERN_METHOD(passValueFromReact:(NSString *)value) // Here exported your swift function for React Native

  /*
   * Removes this warning: "Module SwiftComponentManager requires main queue setup since it overrides `init` but doesn't implement `requiresMainQueueSetup`. In a future release React Native will default to initializing all native modules on a background thread unless explicitly opted-out of."
   */
  + (BOOL)requiresMainQueueSetup
  {
    return NO;
  }
@end
