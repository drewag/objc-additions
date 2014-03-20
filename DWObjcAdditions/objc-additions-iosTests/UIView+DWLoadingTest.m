//
//  UIView+DWLoadingTest.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/19/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIView+DWLoading.h"

@interface UIView_DWLoadingTest : XCTestCase

@end

@implementation UIView_DWLoadingTest

- (void)testShowingAndHidingLoadingScreenWithMessage
{
    UIView *view = [UIView new];
    void (^hideLoading)() = [view showLoadingWithMessage:@"A message"];
    XCTAssertEqualObjects([[view.subviews.firstObject subviews].firstObject text], @"A message");

    if (hideLoading) {
        hideLoading();
    }
    XCTAssertEqual(view.subviews.count, (NSUInteger)0);
}

@end
