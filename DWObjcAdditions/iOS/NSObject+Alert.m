//
//  NSObject+Alert.m
//  Notecards
//
//  Created by Andrew J Wagner on 9/7/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import "NSObject+Alert.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface BlockAlertViewDelegate : NSObject<UIAlertViewDelegate>

@property (nonatomic, copy) void(^onButtonClicked)(NSString *buttonTitle);

- (id)initWithOnButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked;

@end

@implementation BlockAlertViewDelegate

- (id)initWithOnButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked {
    self = [super init];
    if (self) {
        self.onButtonClicked = onButtonClicked;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.onButtonClicked) {
        self.onButtonClicked([alertView buttonTitleAtIndex:buttonIndex]);
    }
}

@end

@implementation NSObject (Alert)

- (void)displayAlertWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
{
    [self displayAlertWithTitle:title
        message:message
        cancelButtonTitle:cancelButtonTitle
        otherButtonTitles:otherButtonTitles
        onButtonClicked:nil
    ];
}

- (void)displayAlertWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
              onButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked
{
    BlockAlertViewDelegate *delegate = [[BlockAlertViewDelegate alloc]
        initWithOnButtonClicked:onButtonClicked
    ];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
        message:message
        delegate:delegate
        cancelButtonTitle:cancelButtonTitle
        otherButtonTitles:nil
    ];
    for (NSString *otherButtonTitle in otherButtonTitles) {
        [alert addButtonWithTitle:otherButtonTitle];
    }

    static const NSString *sDelegateAssociatedObjectKey = @"Delegate";
    objc_setAssociatedObject(alert, &sDelegateAssociatedObjectKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [alert show];
}

@end
