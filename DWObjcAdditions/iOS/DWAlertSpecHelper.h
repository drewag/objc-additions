//
//  DWAlertSpecHelper.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/25/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWAlertSpecHelper : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic, strong, readonly) NSString *cancelButtonTitle;
@property (nonatomic, strong, readonly) NSArray *otherButtonTitles;

+ (void)executeWithHelper:(void(^)(DWAlertSpecHelper *alertHelper))task;
- (void)dismissWithButtonWithTitle:(NSString *)buttonTitle;
- (void)reset;

@end
