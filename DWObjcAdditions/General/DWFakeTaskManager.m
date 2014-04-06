//
//  DWFakeTaskManager.m
//  objc-additions
//
//  Created by Andrew J Wagner on 12/10/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import "DWFakeTaskManager.h"

#import <objc/runtime.h>

@interface DWFakeTaskManager ()

@property (nonatomic, strong) NSMutableArray *backgroundTasks;
@property (nonatomic, strong) NSMutableArray *foregroundTasks;

+ (void)fakeSingleton;
+ (void)restoreSingleton;

@end

static DWFakeTaskManager *fakeTaskManager = nil;

@implementation DWFakeTaskManager

+ (void)executeWithFakeSingleton:(void(^)(DWFakeTaskManager *fakeTaskManager))task {
    fakeTaskManager = [DWFakeTaskManager new];
    [self fakeSingleton];
    if (task) {
        task(fakeTaskManager);
    }
    [self restoreSingleton];
    fakeTaskManager = nil;
}

+ (instancetype)singleton {
    return fakeTaskManager;
}

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundTasks = [NSMutableArray array];
        self.foregroundTasks = [NSMutableArray array];
    }
    return self;
}

- (void)executeTaskInBackground:(void (^)())task {
    [self.backgroundTasks addObject:[task copy]];
}

- (void)executeTaskInForeground:(void(^)())task {
    if (self.performAllForegroundTasksImmediately) {
        task();
    }
    else {
        [self.foregroundTasks addObject:[task copy]];
    }
}

- (void)performNextForegroundTask {
    if (self.foregroundTasks.count > 0) {
        void(^task)() = self.foregroundTasks[0];
        if (task) {
            task();
        }
        [self.foregroundTasks removeObjectAtIndex:0];
    }
}

- (void)performNextBackgroundTask {
    if (self.backgroundTasks.count > 0) {
        void(^task)() = self.backgroundTasks[0];
        if (task) {
            task();
        }
        [self.backgroundTasks removeObjectAtIndex:0];
    }
}

- (void)setPerformAllForegroundTasksImmediately:(BOOL)performAllForegroundTasksImmediately
{
    _performAllForegroundTasksImmediately = performAllForegroundTasksImmediately;

    if (_performAllForegroundTasksImmediately) {
        while (self.foregroundTasks.count > 0) {
            [self performNextForegroundTask];
        }
    }
}

#pragma mark - Private Methods

+ (void)fakeSingleton {
    Method orig_method = class_getClassMethod([DWTaskManager class], @selector(singleton));
    Method new_method = class_getClassMethod([self class], @selector(singleton));
    method_exchangeImplementations(orig_method, new_method);
}

+ (void)restoreSingleton {
    Method new_method = class_getClassMethod([DWTaskManager class], @selector(singleton));
    Method orig_method = class_getClassMethod([self class], @selector(singleton));
    method_exchangeImplementations(orig_method, new_method);
}

@end
