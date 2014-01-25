//
//  BTTPlayer.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTPlayer.h"

@implementation BTTPlayer


- (instancetype)initWithName: (NSString *) name {
    self = [self init];

    if (self) {
        _name = name;
    }

    return self;
}

@end
