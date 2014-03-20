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

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

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
