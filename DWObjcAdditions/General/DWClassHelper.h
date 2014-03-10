//
//  DWClassHelper.h
//  objc-additions
//
//  Created by Andrew J Wagner on 12/5/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWClassHelper : NSObject

+ (void)enumerateClassesWithPrefix:(NSString *)prefix
                         withBlock:(void(^)(NSString *className, Class class))block;

+ (void)enumerateObjectPropertiesOfClass:(Class)objectClass
                               withBlock:(void(^)(NSString *key, Class propertyClass))block;

+ (BOOL)canSetPropertyWithName:(NSString *)propertyName onObject:(NSObject *)object;

+ (BOOL)propertyWithName:(NSString *)propertyName isOfClass:(Class)testClass onObject:(NSObject *)object;
+ (BOOL)propertyWithName:(NSString *)propertyName isUnsignedIntegerOnObject:(NSObject *)object;
+ (BOOL)propertyWithName:(NSString *)propertyName isBoolOnObject:(NSObject *)object;

+ (Class)classOfPropertyWithName:(NSString *)propertyName onObject:(NSObject *)object;

@end
