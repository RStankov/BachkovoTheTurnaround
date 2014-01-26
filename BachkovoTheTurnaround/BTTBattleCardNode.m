//
//  BTTBattleCardSpriteNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleCardNode.h"

@interface BTTBattleCardNode ()

@property (nonatomic) BOOL isAnimationRunning;
@property (nonatomic, strong) SKSpriteNode *unitCardNode;
@property (nonatomic, strong) SKSpriteNode *backCardNode;

@end

@implementation BTTBattleCardNode

- (instancetype)init {
    self = [super init];

    if (self) {
        self.backCardNode = [SKSpriteNode spriteNodeWithImageNamed:@"unit_hidden"];
        self.backCardNode.anchorPoint = CGPointMake(0, 1);
        self.backCardNode.position = CGPointMake(0, 0);

        self.unitCardNode = [SKSpriteNode spriteNodeWithImageNamed:@"unit_1"];
        self.unitCardNode.anchorPoint = CGPointMake(0, 1);
        self.unitCardNode.position = CGPointMake(0, 0);
        self.unitCardNode.xScale = 0;
        
        [self addChild:self.unitCardNode];
        [self addChild:self.backCardNode];
    }

    return self;
}

- (void)flip {
    if (self.isFlipped) {
        [self switchNode:self.unitCardNode withNode:self.backCardNode];
    } else {
        [self switchNode:self.backCardNode withNode:self.unitCardNode];
    }
}

- (void)restore {
    if (self.isFlipped) {
        [self switchNode:self.unitCardNode withNode:self.backCardNode];
    }
}

- (BOOL)isFlipped {
   return self.backCardNode.xScale <= 0;
}

- (void)switchNode:(SKSpriteNode *)fromNode withNode:(SKSpriteNode *)toNode {
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
