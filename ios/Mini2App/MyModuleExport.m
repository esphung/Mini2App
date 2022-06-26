//
//  MyModuleExport.m
//  Mini2App
//
//  Created by Phung, Eric on 6/25/22.
//

#import <Foundation/Foundation.h>

//@interface RCT_EXTERN_MODULE(MyModule, NSObject)

//RCT_EXTERN_METHOD(construct(NSString* name, value:NSInteger))

//@end

#import "MyModuleExport.h"

@implementation RCTMyModuleExport

// To export a module named RCTMyModuleExport
RCT_EXPORT_MODULE(RCTMyModuleExport);

@end
