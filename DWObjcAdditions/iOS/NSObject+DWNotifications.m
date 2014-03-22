//
//  NSObject+DWNotifications.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/21/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "NSObject+DWNotifications.h"

#import <objc/runtime.h>

@interface NotificationTargetBlock : NSObject

@property (nonatomic, copy) void(^onNotified)(NSNotification *notification);

- (id)initWithBlock:(void(^)(NSNotification *notification))block;

- (void)trigger:(NSNotification *)notification;

@end

@implementation NotificationTargetBlock

- (id)initWithBlock:(void(^)(NSNotification *notification))block
{
    self = [super init];
    if (self) {
        self.onNotified = block;
    }
    return self;
}

- (void)trigger:(NSNotification *)notification
{
    if (self.onNotified) {
        self.onNotified(notification);
    }
}

@end

@implementation NSObject (DWNotifications)

- (void(^)())observeNotificationNamed:(NSString *)notificationName withBlock:(void(^)(NSNotification *))block
{
    if (!block) {
        @throw [NSException exceptionWithName:@"DWNotifications" reason:@"You must provide a block to execute when the notification is triggered" userInfo:nil];
    }
    NotificationTargetBlock *targetBlock = [[NotificationTargetBlock alloc] initWithBlock:block];
    [[NSNotificationCenter defaultCenter]
        addObserver:targetBlock
        selector:@selector(trigger:)
        name:notificationName
        object:nil
    ];

    return ^{
        [[NSNotificationCenter defaultCenter]
            removeObserver:targetBlock
            name:notificationName
            object:nil
        ];
    };
}

@end
