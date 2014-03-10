//
//  NSDateFormatter+DWDateFormats.m
//  Notecards
//
//  Created by Andrew J Wagner on 12/22/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import "NSDateFormatter+DWDateFormats.h"

@implementation NSDateFormatter (DWDateFormats)

+ (NSDateFormatter *)railsDateTimeFormatter {
    static NSDateFormatter *formatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		formatter = [[self alloc] init];

        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        [formatter setTimeZone:timeZone];
        [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
	});
	return formatter;
}

@end
