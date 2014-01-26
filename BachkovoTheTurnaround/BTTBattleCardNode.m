//
//  BTTBattleCardSpriteNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleCardNode.h"

@implementation BTTBattleCardNode

- (instancetype)init {
    self = [super init];

    if (self) {
        SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"unit_hidden"];
        back.anchorPoint = CGPointMake(0, 1);
        back.position = CGPointMake(0, 0);
        [self addChild:back];
    }

    return self;
}

@end
