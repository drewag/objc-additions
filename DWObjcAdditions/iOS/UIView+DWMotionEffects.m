//
//  UIView+DWMotionEffects.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 1/15/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "UIView+DWMotionEffects.h"

@implementation UIView (DWMotionEffects)

- (void)applyInterpolationMotionEffectsWithXDistance:(CGFloat)xDistance andYDistance:(CGFloat)yDistance {
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc]
        initWithKeyPath:@"center.x"
        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis
    ];
    xAxis.minimumRelativeValue = @(-xDistance);
    xAxis.maximumRelativeValue = @(xDistance);

    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc]
        initWithKeyPath:@"center.y"
        type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis
    ];
    yAxis.minimumRelativeValue = @(-yDistance);
    yAxis.maximumRelativeValue = @(yDistance);

    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];

    [self addMotionEffect:group];
}

@end
