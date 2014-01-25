//
//  BTTBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBuilding.h"

@implementation BTTBuilding

+(NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Use a subclass";
    });
    
    return name;
}


-(SKNode *) render {
    return [[SKNode alloc] init];
}


@end
