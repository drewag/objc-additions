//
//  DWAlertSpecHelper.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/25/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "DWAlertSpecHelper.h"

#import <objc/runtime.h>

#import "NSObject+DWAlert.h"
#import "DWClassHelper.h"

@interface DWAlertSpecHelper ()

@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *message;
@property (nonatomic, strong, readwrite) NSString *cancelButtonTitle;
@property (nonatomic, strong, readwrite) NSArray *otherButtonTitles;
@property (nonatomic, copy) void(^onButtonClicked)(NSString *buttonTitle);

+ (void)swizzleMethods;

+ (instancetype)singleton;

- (void)fakeDisplayAlertWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtonTitles
                           onButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked;

@end

@implementation DWAlertSpecHelper

+ (instancetype)singleton {
    static id sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

+ (void)swizzleMethods
{
    [DWClassHelper
        swizzleInstanceMethod:@selector(displayAlertWithTitle:message:cancelButtonTitle:otherButtonTitles:onButtonClicked:)
        ofClass:[NSObject class]
        withInstanceMethod:@selector(fakeDisplayAlertWithTitle:message:cancelButtonTitle:otherButtonTitles:onButtonClicked:)
        ofClass:[DWAlertSpecHelper class]
    ];
}

+ (void)executeWithHelper:(void(^)(DWAlertSpecHelper *alertHelper))task
{
    if (!task) { return; }

    [[DWAlertSpecHelper singleton] reset];
    [self swizzleMethods];
    task([DWAlertSpecHelper singleton]);
    [self swizzleMethods];
}

- (void)fakeDisplayAlertWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtonTitles
                           onButtonClicked:(void(^)(NSString *buttonTitle))onButtonClicked
{
    [DWAlertSpecHelper singleton].title = title;
    [DWAlertSpecHelper singleton].message = message;
    [DWAlertSpecHelper singleton].cancelButtonTitle = cancelButtonTitle;
    [DWAlertSpecHelper singleton].otherButtonTitles = otherButtonTitles;
    [DWAlertSpecHelper singleton].onButtonClicked = onButtonClicked;
}

- (void)dismissWithButtonWithTitle:(NSString *)buttonTitle
{
    if (self.onButtonClicked) {
        self.onButtonClicked(buttonTitle);
    }
}

- (void)reset
{
    self.title = nil;
    self.message = nil;
    self.cancelButtonTitle = nil;
    self.otherButtonTitles = nil;
    self.onButtonClicked = nil;
}

@end
