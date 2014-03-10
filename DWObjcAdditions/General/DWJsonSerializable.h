//
//  DWJsonSerializable.h
//  objc-additions
//
//  Created by Andrew J Wagner on 11/26/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DWJsonSerializable <NSObject>

+ (NSDictionary *)jsonMappings;

@end
