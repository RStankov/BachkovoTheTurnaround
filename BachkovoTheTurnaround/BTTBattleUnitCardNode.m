//
//  BTTBattleUnitCardNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleUnitCardNode.h"

@interface BTTBattleUnitCardNode ()

@property (nonatomic, strong) BTTUnit *unit;

@end

@implementation BTTBattleUnitCardNode

- (instancetype)initWithUnit:(BTTUnit *)unit {
    self = [self init];
    
    if (self) {
        self.unit = unit;

        SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:[@"unit_" stringByAppendingString:unit.name]];
        node.anchorPoint = CGPointMake(0, 1);
        node.position = CGPointMake(0, 0);
        [self addChild:node];
    }
    
    return self;
}

@end
