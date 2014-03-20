//
//  UIView+DWMotionEffectsTest.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/19/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIView+DWMotionEffects.h"

@interface UIView_DWMotionEffectsTest : XCTestCase

@end

@implementation UIView_DWMotionEffectsTest

- (void)testApplyInterpolationMotionEffectsWithXDistanceAndYDistance
{
    UIView *view = [UIView new];
    [view applyInterpolationMotionEffectsWithXDistance:2.0f andYDistance:7.0f];

    UIMotionEffectGroup *group = view.motionEffects.firstObject;
    XCTAssertNotNil(group);

    XCTAssertEqual(group.motionEffects.count, (NSUInteger)2);
    UIInterpolatingMotionEffect *firstEffect = group.motionEffects[0];
    XCTAssertTrue([firstEffect isKindOfClass:[UIInterpolatingMotionEffect class]]);
    XCTAssertEqualObjects(firstEffect.keyPath, @"center.x");
    XCTAssertEqual(firstEffect.type, UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis);
    XCTAssertEqual([firstEffect.minimumRelativeValue floatValue], (CGFloat)-2.0f);
    XCTAssertEqual([firstEffect.maximumRelativeValue floatValue], (CGFloat)2.0f);

    UIInterpolatingMotionEffect *secondEffect = group.motionEffects[1];
    XCTAssertTrue([secondEffect isKindOfClass:[UIInterpolatingMotionEffect class]]);
    XCTAssertEqualObjects(secondEffect.keyPath, @"center.y");
    XCTAssertEqual(secondEffect.type, UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis);
    XCTAssertEqual([secondEffect.minimumRelativeValue floatValue], (CGFloat)-7.0f);
    XCTAssertEqual([secondEffect.maximumRelativeValue floatValue], (CGFloat)7.0f);
}

@end
