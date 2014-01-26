//
//  BTTMapBattle.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapEnemy.h"
#import "BTTBattleScene.h"

@implementation BTTMapEnemy

- (SKSpriteNode *)generateSpriteNode {
    return [SKSpriteNode spriteNodeWithImageNamed:@"enemy"];
}

- (void) interactWithPlayer:(BTTPlayer *)player {
    [super interactWithPlayer:player];

    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    BTTBattleScene *scene = [[BTTBattleScene alloc] initWithSize:self.spriteNode.scene.view.bounds.size];
    scene.parentScene = self.spriteNode.scene;

    [self.spriteNode.scene.view presentScene: scene transition: reveal];
}

@end
