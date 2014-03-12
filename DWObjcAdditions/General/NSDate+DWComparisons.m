//
//  NSDate+DWComparisons.m
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 3/12/14.
//  Copyright (c) 2014 Drewag, LLC. All rights reserved.
//

#import "NSDate+DWComparisons.h"

@implementation NSDate (DWComparisons)

- (BOOL)isSameDayAsDate:(NSDate *)otherDate
{
    NSCalendarUnit units = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents *thisComponents = [[NSCalendar currentCalendar] components:units fromDate:self];
    NSDateComponents *otherComponents = [[NSCalendar currentCalendar] components:units fromDate:otherDate];

    return thisComponents.year == otherComponents.year && thisComponents.month == otherComponents.month && thisComponents.day == otherComponents.day;
}

@end
