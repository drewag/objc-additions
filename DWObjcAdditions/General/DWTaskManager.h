//
//  DWTaskManager.h
//  Notecards
//
//  Created by Andrew J Wagner on 12/10/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWTaskManager : NSObject

+ (instancetype)singleton;

- (void)executeTaskInForeground:(void(^)())task;
- (void)executeTaskInBackground:(void(^)())task;

@end
