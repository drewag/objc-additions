//
//  NSObject+Alert.h
//  Notecards
//
//  Created by Andrew J Wagner on 9/7/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import <Foundation/Foundation.h>

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
