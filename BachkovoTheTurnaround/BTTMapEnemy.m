//
//  BTTMapBattle.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapEnemy.h"
#import "BTTBattleScene.h"
#import "BTTUnit.h"

@interface BTTMapEnemy ()

@property (nonatomic, strong) NSArray *enemies;

@end

@implementation BTTMapEnemy

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath enemies:(NSArray *)enemies {
    self = [self initWithIndexPath:indexPath];
    
    if (self) {
        self.enemies = enemies;
    }
    
    return self;
}

- (SKSpriteNode *)generateSpriteNode {
    return [SKSpriteNode spriteNodeWithImageNamed:@"enemy"];
}

- (void) interactWithPlayer:(BTTPlayer *)player {
    [super interactWithPlayer:player];

    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    BTTBattleScene *scene = [[BTTBattleScene alloc] initWithEnemies:self.enemies size:self.spriteNode.scene.view.bounds.size];
    scene.parentScene = self.spriteNode.scene;

    [self.spriteNode.scene.view presentScene: scene transition: reveal];
}

@end
