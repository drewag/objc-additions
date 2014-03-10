//
//  UIImage+Factory.m
//  Notecards
//
//  Created by Andrew J Wagner on 11/28/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import "UIImage+DWFactory.h"

@implementation UIImage (DWFactory)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)imageForRect:(CGRect)rect withColor:(UIColor *)color andCornerRadius:(CGFloat)radius {
    return [self
        imageForRect:rect
        withColor:color
        andCornerRadius:radius
        withCorners:UIRectCornerAllCorners
        withCustomDrawing:nil];
}

+ (UIImage *)imageForRect:(CGRect)rect
                withColor:(UIColor *)color
          andCornerRadius:(CGFloat)radius
              withCorners:(UIRectCorner)corners
{
    return [self
        imageForRect:rect
        withColor:color
        andCornerRadius:radius
        withCorners:corners
        withCustomDrawing:nil];
}

+ (UIImage *)imageForRect:(CGRect)rect
                withColor:(UIColor *)color
          andCornerRadius:(CGFloat)radius
              withCorners:(UIRectCorner)corners
        withCustomDrawing:(void (^)(CGContextRef, CGRect))drawingBlock
{
    rect = CGRectMake(
        rect.origin.x,
        rect.origin.y,
        rect.size.width > 0 ? rect.size.width : 1,
        rect.size.height > 0 ? rect.size.height : 1
    );
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    [color setFill];
    [path fill];

    if (drawingBlock) {
        drawingBlock(UIGraphicsGetCurrentContext(), rect);
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
