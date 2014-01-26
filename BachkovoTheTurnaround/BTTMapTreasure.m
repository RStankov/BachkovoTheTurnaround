//
//  BTTMapTreasure.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapTreasure.h"

@implementation BTTMapTreasure

- (SKSpriteNode *)generateSpriteNode {
    return [SKSpriteNode spriteNodeWithImageNamed:@"treasure"];
}

- (void)interactWithPlayer:(BTTPlayer *)player {
    player.credits += 1000;
    [BTTMapInteractableObject flashText:@"+1000" overNode:self.spriteNode];
    [super interactWithPlayer:player];
}

@end
