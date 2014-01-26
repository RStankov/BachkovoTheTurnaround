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
    SKTexture *texture = [SKTexture textureWithImageNamed:@"treasure"];
    SKSpriteNode *node = [[SKSpriteNode alloc] initWithTexture:texture];
    return node;
}
@end
