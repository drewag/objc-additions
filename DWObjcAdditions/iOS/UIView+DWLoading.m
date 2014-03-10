//
//  UIView+Loading.m
//  Notecards
//
//  Created by Andrew J Wagner on 9/6/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import "UIView+DWLoading.h"

@implementation UIView (DWLoading)

- (void(^)())showLoading {
    return [self showLoadingWithMessage:nil];
}

- (void(^)())showLoadingWithMessage:(NSString *)message {
    UIView *loadingView = [[UIView alloc] initWithFrame:self.bounds];
    loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

    UILabel *messageLabel = [[UILabel alloc] initWithFrame:self.bounds];
    messageLabel.text = message;
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
        |UIViewAutoresizingFlexibleRightMargin
        |UIViewAutoresizingFlexibleTopMargin
        |UIViewAutoresizingFlexibleBottomMargin;
    [messageLabel sizeToFit];
    [loadingView addSubview:messageLabel];

    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator startAnimating];
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
        |UIViewAutoresizingFlexibleRightMargin
        |UIViewAutoresizingFlexibleTopMargin
        |UIViewAutoresizingFlexibleBottomMargin;
    [loadingView addSubview:activityIndicator];

    CGFloat xOrigin = (self.bounds.size.width
        - messageLabel.frame.size.width
        ) / 2;
    CGFloat yOrigin = (self.bounds.size.height
        - messageLabel.frame.size.height
        - activityIndicator.frame.size.height
        + 20
        ) / 2;
    messageLabel.frame = CGRectMake(
        xOrigin,
        yOrigin,
        messageLabel.frame.size.width,
        messageLabel.frame.size.height
    );

    xOrigin = (self.bounds.size.width
        - activityIndicator.frame.size.width
        ) / 2;
    yOrigin -= activityIndicator.frame.size.height + 10;
    activityIndicator.frame = CGRectMake(
        xOrigin,
        yOrigin,
        activityIndicator.frame.size.width,
        activityIndicator.frame.size.height
    );

    [self addSubview:loadingView];

    return ^{
        [loadingView removeFromSuperview];
    };
}

@end
