//
//  BTTBattleScene.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleScene.h"
#import "BTTArmyBar.h"

@interface BTTBattleScene() {
    BTTArmyBar *enemyArmyBar;
    BTTArmyBar *ourArmyBar;
}

@end

@implementation BTTBattleScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
        
        myLabel.text = @"Battle scene";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80);
        [self addChild:myLabel];
        
        
        enemyArmyBar = [[BTTArmyBar alloc] initWithSlotsCount:6 units:@[]];
        enemyArmyBar.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - enemyArmyBar.size.height / 2);
        [self addChild: enemyArmyBar];
        
        ourArmyBar = [[BTTArmyBar alloc] initWithSlotsCount:6 units:@[]];
        ourArmyBar.position = CGPointMake(CGRectGetMidX(self.frame), ourArmyBar.size.height / 2);
        [self addChild: ourArmyBar];
        
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint loc = [touch locationInNode:self];
    if([enemyArmyBar containsPoint:loc]) {
        NSLog(@"attack enemy !!!");
        
        SKNode *touchedCell = [enemyArmyBar nodeAtPoint: [self convertPoint:loc toNode:enemyArmyBar]];
        NSLog(@"tapped on enemey - %@", touchedCell.name);
    }
    
}
@end
