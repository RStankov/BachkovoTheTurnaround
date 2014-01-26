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
    SKTexture *texture = [SKTexture textureWithImageNamed:@"red_crystal"];
    SKSpriteNode *node = [[SKSpriteNode alloc] initWithTexture:texture];
    return node;
}
@end
