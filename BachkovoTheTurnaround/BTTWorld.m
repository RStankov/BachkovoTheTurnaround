//
//  BTTWorld.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTWorld.h"

@implementation BTTWorld

+ (BTTPlayer *)player {
    static dispatch_once_t once;
    static BTTPlayer *player;

    dispatch_once(&once, ^ {
        player = [[BTTPlayer alloc] initWithName:@"Test Testers" credits:1000];
    });

    return player;
}

@end
