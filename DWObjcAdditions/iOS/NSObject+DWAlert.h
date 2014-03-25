//
//  NSObject+Alert.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 9/7/13.
//  Copyright (c) 2013 Drewag, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (DWAlert)

- (void)displayAlertWithTitle:(NSString *)title
                               message:(NSString *)message
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     otherButtonTitles:(NSArray *)otherButtonTitles;

- (void)displayAlertWithTitle:(NSString *)title
                               message:(NSString *)message
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     otherButtonTitles:(NSArray *)otherButtonTitles
                       onButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked;

@end
