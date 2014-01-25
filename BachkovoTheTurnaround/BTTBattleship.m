//
//  BTTBattleship.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleship.h"

@interface BTTBattleship ()

@property (nonatomic, weak) BTTPlayer *player;

@end

@implementation BTTBattleship

- (instancetype) initWithPlayer:(BTTPlayer *)player name:(NSString *)name {
    self = [self init];

    if (self) {
        _name = name;
        _player = player;
    }

    return self;
}

@end
