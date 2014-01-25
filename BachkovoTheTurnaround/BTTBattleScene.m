//
//  BTTBattleScene.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleScene.h"

@implementation BTTBattleScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
        
        myLabel.text = @"Battle scene";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80);
        
        NSLog(@"%f", myLabel.position.y);
        
        [self addChild:myLabel];
    }
    return self;
}

@end
