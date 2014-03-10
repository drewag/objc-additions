//
//  UIImage+Factory.h
//  Notecards
//
//  Created by Andrew J Wagner on 11/28/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DWFactory)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageForRect:(CGRect)rect withColor:(UIColor *)color andCornerRadius:(CGFloat)radius;
+ (UIImage *)imageForRect:(CGRect)rect
                withColor:(UIColor *)color
          andCornerRadius:(CGFloat)radius
              withCorners:(UIRectCorner)corners;
+ (UIImage *)imageForRect:(CGRect)rect
                withColor:(UIColor *)color
          andCornerRadius:(CGFloat)radius
              withCorners:(UIRectCorner)corners
        withCustomDrawing:(void(^)(CGContextRef context, CGRect rect))drawingBlock;

@end
