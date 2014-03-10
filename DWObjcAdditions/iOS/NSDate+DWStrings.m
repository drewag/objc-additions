//
//  NSDate+DWStrings.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/10/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "NSDate+DWStrings.h"

#import "NSDateFormatter+DWDateFormats.h"

@implementation NSDate (DWStrings)

- (NSInteger)daysAgoFromNow
{
    NSDate *fromDate;
    NSDate *toDate;

    NSCalendar *calendar = [NSCalendar currentCalendar];

    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
        interval:NULL forDate:self];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
        interval:NULL forDate:[NSDate date]];

    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
        fromDate:fromDate toDate:toDate options:0];

    return [difference day];
}

- (NSString *)longHumanReadableString
{
    NSInteger daysAgoFromNow = [self daysAgoFromNow];
    NSMutableString *string = [NSMutableString new];
    BOOL customDay = NO;
    if (daysAgoFromNow == 0) {
        [string appendString:@"Today"];
        customDay = YES;
    }
    else if (daysAgoFromNow == 1) {
        [string appendString:@"Yesterday"];
        customDay = YES;
    }
    else if (daysAgoFromNow > 1 && daysAgoFromNow < 7) {
        [string appendString:[[NSDateFormatter weekDayFormatter] stringFromDate:self]];
        customDay = YES;
    }

    if (!customDay) {
        [string appendString:[[NSDateFormatter longHumanReadableDateTimeFormatter] stringFromDate:self]];
    }
    else {
        [string appendFormat:@" at %@", [[NSDateFormatter amPMTimeFormatter] stringFromDate:self]];
    }

    return string;
}

@end
