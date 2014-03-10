//
//  DWJsonSerializer.m
//  objc-additions
//
//  Created by Andrew J Wagner on 11/26/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import "DWJsonSerializer.h"

#import "DWClassHelper.h"

#import "NSDateFormatter+DWDateFormats.h"

#import "DWJsonSerializable.h"

@interface DWJsonSerializer ()

+ (void)setValue:(id)value onObject:(id)object forProperty:(NSString *)property;

@end

@implementation DWJsonSerializer

+ (NSDictionary *)dictionaryFromObject:(id)object {
    if (![[object class] conformsToProtocol:@protocol(DWJsonSerializable)]) {
        @throw [NSException
            exceptionWithName:DWJsonSeralizerExceptionInvalidObject
            reason:@"The object does not implement the DWJsonSerializable protocol"
            userInfo:nil
        ];
    }

    id<DWJsonSerializable> serializable = (id<DWJsonSerializable>)object;

    NSDictionary *mappings = [[serializable class] jsonMappings];
    NSMutableDictionary *output = [NSMutableDictionary dictionaryWithCapacity:mappings.count];
    [mappings enumerateKeysAndObjectsUsingBlock:^(NSString *jsonKey, NSString *objectKey, BOOL *stop) {
        SEL selector = NSSelectorFromString(objectKey);
        if (![object respondsToSelector:selector]) {
            @throw [NSException
                exceptionWithName:DWJsonSeralizerExceptionInvalidObject
                reason:[NSString stringWithFormat:@"The object does not have a property for %@", objectKey]
                userInfo:nil
            ];
        }

        id value = [object valueForKey:objectKey];
        if (value) {
            if ([[value class] conformsToProtocol:@protocol(DWJsonSerializable)]) {
                value = [DWJsonSerializer dictionaryFromObject:value];
            }
            else if ([[value class] isSubclassOfClass:[NSDate class]]) {
                value = RAILS_STRING(value);
            }
            [output setObject:value forKey:jsonKey];
        }
    }];

    return output;
}

+ (NSString *)serializeToStringFromObject:(id)object {
    NSDictionary *output = [self dictionaryFromObject:object];

    NSData *data = [NSJSONSerialization dataWithJSONObject:output options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

+ (id)objectFromDictionary:(NSDictionary *)dictionary forClass:(Class)class {
    NSDictionary *mappings = [class jsonMappings];
    id object = [class new];
    for (NSString *key in dictionary) {
        if (mappings[key]) {
            [self setValue:dictionary[key] onObject:object forProperty:mappings[key]];
        }
    }
    return object;
}

#pragma mark - Private Methods

+ (void)setValue:(id)value onObject:(id)object forProperty:(NSString *)property {
    Class propertyClass = [DWClassHelper classOfPropertyWithName:property onObject:object];
    if ([propertyClass conformsToProtocol:@protocol(DWJsonSerializable)]) {
        value = [DWJsonSerializer objectFromDictionary:value forClass:propertyClass];
        [object setValue:value forKey:property];
    }
    else if ([propertyClass isSubclassOfClass:[NSDate class]]) {
        [object setValue:RAILS_DATE(value) forKey:property];
    }
    else if ([DWClassHelper propertyWithName:property isUnsignedIntegerOnObject:object]) {
        [object setValue:@([value unsignedIntegerValue]) forKey:property];
    }
    else if ([DWClassHelper propertyWithName:property isBoolOnObject:object]) {
        [object setValue:@([value boolValue]) forKey:property];
    }
    else {
        [object setValue:value forKey:property];
    }
}

@end
