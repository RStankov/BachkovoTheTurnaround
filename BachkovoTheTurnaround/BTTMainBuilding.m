//
//  BTTMainBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Genadi Samokovarov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMainBuilding.h"

@implementation BTTMainBuilding

+ (NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Main Building";
    });
    
    return name;
}

-(SKNode *) render {
    return [[SKNode alloc] init];
}

@end
