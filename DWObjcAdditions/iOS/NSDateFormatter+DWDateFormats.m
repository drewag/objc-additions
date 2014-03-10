//
//  NSDateFormatter+DWDateFormats.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 12/22/13.
//  Copyright (c) 2013 Drewag, LLC. All rights reserved.
//

#import "NSDateFormatter+DWDateFormats.h"

@implementation NSDateFormatter (DWDateFormats)

+ (NSDateFormatter *)railsDateTimeFormatter
{
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

+ (NSDateFormatter *)iso8601DateTimeFormatter
{
    static NSDateFormatter *formatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		formatter = [[self alloc] init];
        [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"];
	});
	return formatter;
}

+ (NSDateFormatter *)longHumanReadableDateTimeFormatter
{
    static NSDateFormatter *formatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		formatter = [[self alloc] init];
        [formatter setDateFormat:@"MMMM d' at 'h':'mm a"];
	});
	return formatter;
}

+ (NSDateFormatter *)weekDayFormatter
{
    static NSDateFormatter *formatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		formatter = [[self alloc] init];
        [formatter setDateFormat:@"EEEE"];
	});
	return formatter;
}

+ (NSDateFormatter *)amPMTimeFormatter
{
    static NSDateFormatter *formatter = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		formatter = [[self alloc] init];
        [formatter setDateFormat:@"h':'mm a"];
	});
	return formatter;
}

@end
