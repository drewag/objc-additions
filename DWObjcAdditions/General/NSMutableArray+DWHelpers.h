//
//  NSMutableArray+DWHelpers.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/12/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (DWHelpers)

- (void)updateWithNewArray:(NSArray *)array andEquivelanceTester:(BOOL(^)(id oldObject, id newObject))equivelanceTester;

@end
