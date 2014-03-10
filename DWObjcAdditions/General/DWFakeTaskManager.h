//
//  DWFakeTaskManager.h
//  objc-additions
//
//  Created by Andrew J Wagner on 12/10/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DWTaskManager.h"

@interface DWFakeTaskManager : DWTaskManager

+ (void)executeWithFakeSingleton:(void(^)(DWFakeTaskManager *fakeTaskManager))task;

- (void)performNextBackgroundTask;
- (void)performNextForegroundTask;

@end
