//
//  NCTextView.m
//  Notecards
//
//  Created by Andrew J Wagner on 11/29/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import "DWPlaceholderTextView.h"

@interface DWPlaceholderTextView ()

@property (nonatomic, strong) UITextView *placeholderTextView;

- (void)textChanged:(NSNotification *)notification;
- (void)sharedSetup;

@end

@implementation DWPlaceholderTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sharedSetup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.placeholderTextView.frame = CGRectMake(
        0,
        0,
        self.bounds.size.width,
        self.bounds.size.height
    );
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderTextView.text = placeholder;
    [self setNeedsLayout];
}

- (NSString *)placeholder {
    return self.placeholderTextView.text;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderTextView.font = font;
}

#pragma mark - Private Methods

- (void)sharedSetup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];

    self.placeholderTextView = [[UITextView alloc] initWithFrame:self.bounds];
    self.placeholderTextView.userInteractionEnabled = NO;
    [self addSubview:self.placeholderTextView];
    self.placeholderTextView.font = self.font;
    self.placeholderTextView.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    self.placeholderTextView.backgroundColor = [UIColor clearColor];
    self.placeholderTextView.textAlignment = self.textAlignment;
}

- (void)textChanged:(NSNotification *)notification {
    if([[self placeholder] length] == 0) {
        return;
    }

    self.placeholderTextView.hidden = self.text.length > 0;
}

- (void)setText:(NSString *)text {
    [super setText:text];

    [self textChanged:nil];
}

@end
