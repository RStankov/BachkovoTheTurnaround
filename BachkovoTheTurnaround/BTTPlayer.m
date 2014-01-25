//
//  BTTPlayer.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTPlayer.h"

@implementation BTTPlayer


- (instancetype)initWithName: (NSString *) name credits: (NSInteger)credits {
    self = [self init];

    if (self) {
        _name    = name;
        _credits = credits;
    }

    return self;
}

@end
