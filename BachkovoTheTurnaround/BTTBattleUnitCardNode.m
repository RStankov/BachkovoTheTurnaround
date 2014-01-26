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
@property (nonatomic, strong) SKSpriteNode *unitNode;
@property (nonatomic, strong) SKLabelNode *labelNode;

@end

@implementation BTTBattleUnitCardNode

- (instancetype)initWithUnit:(BTTUnit *)unit {
    self = [self init];
    
    if (self) {
        self.unit = unit;

        self.unitNode = [SKSpriteNode spriteNodeWithImageNamed:[@"unit_" stringByAppendingString:unit.name]];
        self.unitNode.anchorPoint = CGPointMake(0, 1);
        self.unitNode.position = CGPointMake(0, 0);

        [self addChild:self.unitNode];

        self.labelNode = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];

        self.labelNode.color = [SKColor redColor];
        self.labelNode.colorBlendFactor = 0.9;
        self.labelNode.fontSize = 20;
        self.labelNode.position = CGPointMake(24, -self.unitNode.size.width);

        [self addChild:self.labelNode];

        [self redraw];
    }
    
    return self;
}

- (void)redraw {
    self.labelNode.text = [NSString stringWithFormat:@"%0.3ld", (long)self.unit.count];
    self.unitNode.alpha = self.unit.count > 0 ? 1 : 0.2;
}

@end
