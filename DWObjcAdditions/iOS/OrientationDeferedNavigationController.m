//
//  OrientationDeferedNavigationController.m
//  Notecards
//
//  Created by Andrew J Wagner on 10/5/13.
//  Copyright (c) 2013 Learn Brigade. All rights reserved.
//

#import "OrientationDeferedNavigationController.h"

@implementation OrientationDeferedNavigationController

- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate {
    return [self.topViewController supportedInterfaceOrientations];
}

@end
