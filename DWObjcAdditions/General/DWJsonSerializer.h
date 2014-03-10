//
//  DWJsonSerializer.h
//  objc-additions
//
//  Created by Andrew J Wagner on 11/26/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DWJsonSeralizerExceptionInvalidObject @"DWJsonSerializerInvalidObject"

@interface DWJsonSerializer : NSObject

+ (NSDictionary *)dictionaryFromObject:(id)object;
+ (NSString *)serializeToStringFromObject:(id)object;

+ (id)objectFromDictionary:(NSDictionary *)dictionary forClass:(Class)class;

@end
