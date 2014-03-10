//
//  DWTaskManager.m
//  Notecards
//
//  Created by Andrew J Wagner on 12/10/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import "DWTaskManager.h"

@interface DWTaskManager ()

@property (nonatomic, strong) NSOperationQueue *backgroundOperationQueue;

@end

@implementation DWTaskManager

+ (instancetype)singleton {
    static id sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundOperationQueue = [NSOperationQueue new];
        self.backgroundOperationQueue.maxConcurrentOperationCount = 3;
    }
    return self;
}

- (void)executeTaskInForeground:(void(^)())task {
    dispatch_async(dispatch_get_main_queue(), task);
}

- (void)executeTaskInBackground:(void(^)())task {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:task];
    [self.backgroundOperationQueue addOperation:operation];
}

@end
