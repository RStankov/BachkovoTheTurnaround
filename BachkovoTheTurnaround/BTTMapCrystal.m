//
//  BTTMapCrystal.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapCrystal.h"

@implementation BTTMapCrystal

- (SKSpriteNode *)generateSpriteNode {
    return [[SKSpriteNode alloc] initWithImageNamed:@"red_crystal"];
}

- (void)interactWithPlayer:(BTTPlayer *)player {
    player.credits += 200;
    [BTTMapInteractableObject flashText:@"+200" overNode:self.spriteNode];
    [super interactWithPlayer:player];
}

@end
