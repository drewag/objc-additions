//
//  ObservableTextField.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 10/11/13.
//  Copyright (c) 2013 Drewag, LLC. All rights reserved.
//

#import "DWObservableTextField.h"

@interface DWObservableTextField ()

- (void)startObserving;
- (void)textValueDidChange;

@end

@implementation DWObservableTextField

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
        name:UITextFieldTextDidChangeNotification object:self
    ];
}

#pragma mark - Private Methods

- (void)startObserving {
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(textValueDidChange)
        name:UITextFieldTextDidChangeNotification
        object:self
    ];
}

- (void)textValueDidChange {
    [self willChangeValueForKey:@"text"];
    [self didChangeValueForKey:@"text"];
}

@end
