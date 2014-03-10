//
//  NSDateFormatter+NCDateFormats.h
//  objc-additions-ios
//
//  Created by Andrew J Wagner on 12/22/13.
//  Copyright (c) 2013 Drewag, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RAILS_DATE(string) [[NSDateFormatter railsDateTimeFormatter] dateFromString:string]
#define RAILS_STRING(date) [[NSDateFormatter railsDateTimeFormatter] stringFromDate:date]

#define ISO8601_DATE(string) [[NSDateFormatter iso8601DateTimeFormatter] dateFromString:string]
#define ISO8601_STRING(date) [[NSDateFormatter iso8601DateTimeFormatter] stringFromDate:date]

@interface NSDateFormatter (DWDateFormats)

+ (NSDateFormatter *)railsDateTimeFormatter;
+ (NSDateFormatter *)iso8601DateTimeFormatter;

+ (NSDateFormatter *)longHumanReadableDateTimeFormatter;

+ (NSDateFormatter *)weekDayFormatter;

+ (NSDateFormatter *)amPMTimeFormatter;

@end
