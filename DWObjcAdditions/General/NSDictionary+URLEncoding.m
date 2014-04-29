//
//  NSDictionary+URLEncoding.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 4/29/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "NSDictionary+URLEncoding.h"

@implementation NSDictionary (URLEncoding)

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

- (NSString *)URLEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey:key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

@end
