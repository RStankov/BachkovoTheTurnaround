//
//  BTTBattleCardSpriteNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleCardNode.h"
#import "BTTBattleUnitCardNode.h"

@interface BTTBattleCardNode ()

@property (nonatomic) BOOL isUnit;
@property (nonatomic) BTTUnit *realUnit;
@property (nonatomic) BOOL isAnimationRunning;
@property (nonatomic, strong) SKNode *frontCardNode;
@property (nonatomic, strong) SKSpriteNode *backCardNode;

@end

@implementation BTTBattleCardNode

- (instancetype)init {
    self = [super init];

    if (self) {
        self.unit = nil;
        
        self.backCardNode = [SKSpriteNode spriteNodeWithImageNamed:@"unit_hidden"];
        self.backCardNode.anchorPoint = CGPointMake(0, 1);
        self.backCardNode.position = CGPointMake(0, 0);
       
        [self addChild:self.backCardNode];
    }

    return self;
}

- (void)setUnit:(BTTUnit *)unit {
    if (self.frontCardNode) {
        [self.frontCardNode removeFromParent];
        self.frontCardNode = nil;
    }

    if (unit == nil) {
        SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:@"unit_missing"];
        node.anchorPoint = CGPointMake(0, 1);

        self.frontCardNode = node;
        self.isUnit = NO;
    } else {
        self.frontCardNode = [[BTTBattleUnitCardNode alloc] initWithUnit:unit];
        self.isUnit = YES;
    }
    
    self.realUnit = unit;
    self.frontCardNode.position = CGPointMake(0, 0);
    self.frontCardNode.xScale = 0;
    
    [self addChild:self.frontCardNode];
}

- (void)redraw {
    if (self.isUnit) {
        [(BTTBattleUnitCardNode *)self.frontCardNode redraw];
    }
}

- (void)flip {
    if (!self.isFlipped) {
        [self switchNode:self.backCardNode withNode:self.frontCardNode];
    }
}

- (void)attackedBy:(BTTUnit *)unit {
    if (!self.isFlipped) {
        [self switchNode:self.backCardNode withNode:self.frontCardNode];
    }

    if (self.isUnit) {
        self.realUnit.count = MAX(0, self.realUnit.count - 1);
    }
}

- (void)restore {
    if (self.isFlipped) {
        [self switchNode:self.frontCardNode withNode:self.backCardNode];
    }
}

- (BOOL)isFlipped {
   return self.backCardNode.xScale <= 0;
}

- (void)switchNode:(SKNode *)fromNode withNode:(SKNode *)toNode {
    if (self.isAnimationRunning) {
        return;
    }

    self.isAnimationRunning = YES;

    [fromNode runAction:[SKAction group:@[
                                          [SKAction moveToX:fromNode.frame.size.width duration: 0.5],
                                          [SKAction scaleXTo:0 duration:0.5]
                                          ]] completion:^{
                                            fromNode.position = CGPointMake(0, 0);
                                            self.isAnimationRunning = NO;
                                          }];

    [toNode runAction:[SKAction scaleXTo:1 duration:0.5]];
}

@end
