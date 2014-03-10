//
//  NSDateFormatter+NCDateFormats.h
//  Notecards
//
//  Created by Andrew J Wagner on 12/22/13.
//  Copyright (c) 2013 Digital Assertion. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RAILS_DATE(string) [[NSDateFormatter railsDateTimeFormatter] dateFromString:string]
#define RAILS_STRING(date) [[NSDateFormatter railsDateTimeFormatter] stringFromDate:date]

@interface NSDateFormatter (DWDateFormats)

+ (NSDateFormatter *)railsDateTimeFormatter;

@end
