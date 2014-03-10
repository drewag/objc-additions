//
//  UIDevice+Hardware.m
//  Notecards
//
//  Created by Andrew J Wagner on 10/11/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import "UIDevice+DWHardware.h"

#import <sys/utsname.h>

@implementation UIDevice (DWHardware)

- (NSString *)hardwareModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *raw = [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];

    NSDictionary *transform = @{
        @"i386": @"Simulator",
        @"iPod1,1": @"iPod Touch",
        @"iPod2,1": @"iPod Touch Second Generation",
        @"iPod3,1": @"iPod Touch Third Generation",
        @"iPod4,1": @"iPod Touch Fourth Generation",
        @"iPhone1,1": @"iPhone",
        @"iPhone1,2": @"iPhone 3G",
        @"iPhone2,1": @"iPhone 3GS",
        @"iPad1,1": @"iPad",
        @"iPad2,1": @"iPad 2",
        @"iPad3,1": @"iPad 3",
        @"iPad3,4": @"iPad 4",
        @"iPhone3,1": @"iPhone 4",
        @"iPhone4,1": @"iPhone 4S",
        @"iPhone5,1": @"iPhone 5 (model A1428, AT&T/Canada)",
        @"iPhone5,2": @"iPhone 5 (model A1429)",
        @"iPad2,5": @"iPad Mini",
        @"iPhone5,3": @"iPhone 5c (model A1456, A1532 | GSM)",
        @"iPhone5,4": @"iPhone 5c (model A1507, A1516, A1526 (China), A1529 | Global)",
        @"iPhone6,1": @"iPhone 5s (model A1433, A1533 | GSM)",
        @"iPhone6,2": @"iPhone 5s (model A1457, A1518, A1528 (China), A1530 | Global)",
    };

    NSString *model = transform[raw];
    if (!model) {
        model = raw;
    }
    return model;
}

@end
