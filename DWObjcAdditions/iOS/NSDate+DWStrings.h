//
//  NSDate+DWStrings.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/10/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DWStrings)

- (NSInteger)daysAgoFromNow;
- (NSString *)longHumanReadableString;

@end
