//
//  UIView+Effects.h
//  Notecards
//
//  Created by Andrew J Wagner on 1/15/14.
//  Copyright (c) 2014 Digital Assertion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DWMotionEffects)

- (void)applyInterpolationMotionEffectsWithXDistance:(CGFloat)xDistance andYDistance:(CGFloat)yDistance;

@end
