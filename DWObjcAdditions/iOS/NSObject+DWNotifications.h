//
//  NSObject+DWNotifications.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/21/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DWNotifications)

- (void(^)())observeNotificationNamed:(NSString *)notificationName
                            withBlock:(void(^)(NSNotification *notification))block;

@end
