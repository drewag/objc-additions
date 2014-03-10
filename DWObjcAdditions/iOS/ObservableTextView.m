//
//  ObservableTextView.m
//  Notecards
//
//  Created by Andrew J Wagner on 8/11/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import "ObservableTextView.h"

@interface ObservableTextView ()

- (void)startObserving;
- (void)textValueDidChange;

@end

@implementation ObservableTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self startObserving];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self startObserving];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
        removeObserver:self
        name:UITextViewTextDidChangeNotification object:self
    ];
}

#pragma mark - Private Methods

- (void)startObserving {
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(textValueDidChange)
        name:UITextViewTextDidChangeNotification
        object:self
    ];
}

- (void)textValueDidChange {
    [self willChangeValueForKey:@"text"];
    [self didChangeValueForKey:@"text"];
}

@end
