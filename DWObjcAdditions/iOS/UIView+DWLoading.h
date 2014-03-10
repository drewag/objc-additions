//
//  UIView+Loading.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 9/6/13.
//  Copyright (c) 2013 Drewag, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DWLoading)

- (void(^)())showLoading;
- (void(^)())showLoadingWithMessage:(NSString *)message;

@end
