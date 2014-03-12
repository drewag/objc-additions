//
//  NSMutableArray+DWHelpers.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/12/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "NSMutableArray+DWHelpers.h"

@implementation NSMutableArray (DWHelpers)

- (void)updateWithNewArray:(NSArray *)array andEquivelanceTester:(BOOL(^)(id oldObject, id newObject))equivelanceTester
{
    for (id newObject in array) {
        __block BOOL replaced = NO;
        [self enumerateObjectsUsingBlock:^(id oldObject, NSUInteger idx, BOOL *stop) {
            if (equivelanceTester(oldObject, newObject)) {
                [self replaceObjectAtIndex:idx withObject:newObject];
                *stop = YES;
                replaced = YES;
            }
        }];

        if (!replaced) {
            [self addObject:newObject];
        }
    }

    NSUInteger idx = 0;
    while (idx < self.count) {
        id oldObject = self[idx];
        BOOL found = NO;
        for (id newObject in array) {
            if (equivelanceTester(oldObject, newObject)) {
                found = YES;
                break;
            }
        }
        if (found) {
            idx++;
        }
        else {
            [self removeObjectAtIndex:idx];
        }
    }
}

@end
