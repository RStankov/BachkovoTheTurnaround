//
//  BTTUnit.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTUnit.h"

@implementation BTTUnit

+ (instancetype)createUnit1WithCount:(NSInteger)count {
    BTTUnit *unit = [[BTTUnit alloc] init];

    unit.name = @"1";
    unit.count  = count;

    return unit;
}

+ (instancetype)createUnit2WithCount:(NSInteger)count {
    BTTUnit *unit = [[BTTUnit alloc] init];

    unit.name = @"2";
    unit.count  = count;

    return unit;
}

+ (instancetype)createUnit3WithCount:(NSInteger)count {
    BTTUnit *unit = [[BTTUnit alloc] init];

    unit.name = @"3";
    unit.count  = count;

    return unit;
}
@end
