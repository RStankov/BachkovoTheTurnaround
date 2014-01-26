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
        player = [[BTTPlayer alloc] init];
        player.credits = 1000;
        player.name = @"Test Testers";
        player.attack = 4;
        player.defence = 3;
        player.mobility = 2;
    });

    return player;
}

@end
