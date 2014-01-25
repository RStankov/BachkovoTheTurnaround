//
//  BTTMechGarrisonBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMechGarrisonBuilding.h"

@implementation BTTMechGarrisonBuilding


+ (NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Mech Garrison";
    });
    
    return name;
}

-(BTTUnit *)buyUnit:(BTTUnit *)unit{
    return [[BTTUnit alloc] init];
}

@end
