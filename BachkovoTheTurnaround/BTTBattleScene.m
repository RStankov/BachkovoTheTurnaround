//
//  BTTBattleScene.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleScene.h"
#import "BTTBattleCardNode.h"
#import "BTTBattleUnitCardNode.h"
#import "BTTWorld.h"

@interface BTTBattleScene()

@property (nonatomic) NSInteger phase;
@property (nonatomic) NSMutableArray *enemyCardNodes;
@property (nonatomic) NSArray *enemyUnits;
@property (nonatomic) NSMutableArray *playerCardNodes;

@end

@implementation BTTBattleScene

-(instancetype)initWithEnemies:(NSArray *)enemies size:(CGSize) size {
    self = [self initWithSize:size];
    
    if (self = [super initWithSize:size]) {
        self.phase = 0;

        self.anchorPoint = CGPointMake(0, 1);
        
        SKSpriteNode *background  = [SKSpriteNode spriteNodeWithImageNamed:@"battleground"];
        background.anchorPoint = CGPointMake(0, 1);
        background.position = CGPointMake(0, 0);
        
        [self addChild:background];
       
        self.playerCardNodes = [NSMutableArray array];
        
        NSInteger i = 0;
        for (BTTUnit *unit in [BTTWorld player].units) {
            BTTBattleUnitCardNode *card = [[BTTBattleUnitCardNode alloc] initWithUnit:unit];
            card.position = CGPointMake(44 + 99 * i, -11 - 204.5);
            [self addChild:card];
            [self.playerCardNodes addObject:card];
            
            i += 1;
        }
       
        self.enemyCardNodes = [NSMutableArray array];
        
        
        self.enemyUnits = enemies;

        for(NSInteger i=0; i<5; i++) {
            BTTBattleCardNode *card = [[BTTBattleCardNode alloc] init];
            card.position = CGPointMake(44 + 99 * i, -11);
            
            if (i < self.enemyUnits.count) {
                card.unit = self.enemyUnits[i];
            }
            
            [self addChild:card];
            [self.enemyCardNodes addObject:card];
        }
    }
    return self;
}

- (void)update:(NSTimeInterval)currentTime {
    [self.playerCardNodes makeObjectsPerformSelector:@selector(redraw)];
    [self.enemyCardNodes makeObjectsPerformSelector:@selector(redraw)];
}

- (void)cardWasChoosen:(BTTBattleCardNode *)card {
    if (self.phase == 0) {
        [card flip];
    } else if (self.phase == 1) {
        [card attackedBy:[BTTWorld player].units.firstObject];
    } else if (self.phase == 2) {
        if (![self anyUnitsLeft:self.enemyUnits]) {
            [self.enemyCardNodes makeObjectsPerformSelector:@selector(flip)];
            self.phase = 3;
        
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
            [self.scene.view presentScene:self.parentScene transition: reveal];
            return;
        }
        
        if (![self anyUnitsLeft:BTTWorld.player.units]) {
            NSLog(@"LOSE");
            [self.enemyCardNodes makeObjectsPerformSelector:@selector(flip)];
            self.phase = 3;
            return;
        }

        [self.enemyCardNodes makeObjectsPerformSelector:@selector(restore)];
    }
 
    if (self.phase < 3) {
        self.phase = (self.phase + 1) % 3;
    }
}

- (BOOL)anyUnitsLeft:(NSArray *)units {
    for (BTTUnit *unit in units) {
        if (unit.count > 0) {
            return YES;
        }
    }
    
    return NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self];
    
    for(SKNode *node = [self nodeAtPoint:point]; node; node = node.parent) {
        if ([node isKindOfClass:[BTTBattleCardNode class]]) {
            BTTBattleCardNode *card = (BTTBattleCardNode *) node;
            [self cardWasChoosen:card];
        }
    }
}

@end
