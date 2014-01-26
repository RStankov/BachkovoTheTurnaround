//
//  BTTBattleScene.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTArmyBar.h"
#import "BTTBattleScene.h"

@interface BTTBattleScene() {
    BTTArmyBar *enemyArmyBar;
    BTTArmyBar *ourArmyBar;
}

@end

@implementation BTTBattleScene

- (id) initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.anchorPoint = CGPointMake(0, 1);
        
        SKSpriteNode *background  = [SKSpriteNode spriteNodeWithImageNamed:@"battleground"];
        background.anchorPoint = CGPointMake(0, 1);
        background.position = CGPointMake(0, 0);
        
        [self addChild:background];
        
        
        SKSpriteNode *card;
        
        card = [SKSpriteNode spriteNodeWithImageNamed:@"unit_1"];
        card.anchorPoint = CGPointMake(0, 1);
        card.position = CGPointMake(44 + 99 * 0, -11);

        [self addChild:card];
        
        card = [SKSpriteNode spriteNodeWithImageNamed:@"unit_2"];
        card.anchorPoint = CGPointMake(0, 1);
        card.position = CGPointMake(44 + 99 * 1, -11);

        [self addChild:card];

        card = [SKSpriteNode spriteNodeWithImageNamed:@"unit_3"];
        card.anchorPoint = CGPointMake(0, 1);
        card.position = CGPointMake(44 + 99 * 2, -11);

        [self addChild:card];

        card = [SKSpriteNode spriteNodeWithImageNamed:@"unit_hidden"];
        card.anchorPoint = CGPointMake(0, 1);
        card.position = CGPointMake(44 + 99 * 3, -11);

        [self addChild:card];

        card = [SKSpriteNode spriteNodeWithImageNamed:@"unit_1"];
        card.anchorPoint = CGPointMake(0, 1);
        card.position = CGPointMake(44 + 99 * 0, -11 - 204.5);

        [self addChild:card];

        enemyArmyBar = [[BTTArmyBar alloc] initWithSlotsCount:6 units:@[]];
        enemyArmyBar.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - enemyArmyBar.size.height / 2);
        [self addChild: enemyArmyBar];

        ourArmyBar = [[BTTArmyBar alloc] initWithSlotsCount:6 units:@[]];
        ourArmyBar.position = CGPointMake(CGRectGetMidX(self.frame), ourArmyBar.size.height / 2);
        [self addChild: ourArmyBar];

    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];

    CGPoint loc = [touch locationInNode:self];
    if([enemyArmyBar containsPoint:loc]) {
        NSLog(@"attack enemy !!!");

        SKNode *touchedCell = [enemyArmyBar nodeAtPoint: [self convertPoint:loc toNode:enemyArmyBar]];
        NSLog(@"tapped on enemey - %@", touchedCell.name);
    }

}

@end
