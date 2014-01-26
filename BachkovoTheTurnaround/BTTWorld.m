//
//  BTTWorld.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTWorld.h"
#import "BTTUnit.h"

@implementation BTTWorld

+ (BTTPlayer *)player {
    static dispatch_once_t once;
    static BTTPlayer *player;

    dispatch_once(&once, ^ {
        BTTUnit *unit1 = [BTTUnit createUnit1WithCount:10];
        BTTUnit *unit2 = [BTTUnit createUnit1WithCount:10];
        BTTUnit *unit3 = [BTTUnit createUnit1WithCount:10];
        
        player = [[BTTPlayer alloc] init];
        player.credits = 1000;
        player.name = @"Test Testers";
        player.attack = 4;
        player.defence = 3;
        player.mobility = 2;
        player.units = @[unit1, unit2, unit3];
    });

    return player;
}

@end
