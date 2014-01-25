//
//  BTTBattleScene.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleScene.h"

@interface BTTBattleScene() {
    SKSpriteNode *enemiesBar;
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
        
        CGSize barSize = self.frame.size;
        barSize.height = 40;
        
        
        enemiesBar = [[SKSpriteNode alloc] initWithColor:[UIColor greenColor] size:barSize];
        enemiesBar.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - barSize.height / 2);
        [self addChild:enemiesBar];
        
        
        int cellsCount = 6;
        int cellRightMargin = 2;
        
        CGSize cellDimensions = CGSizeMake((barSize.width - ((cellsCount - 1)) * cellRightMargin) / cellsCount, barSize.height);
        CGPoint cellPosition = CGPointMake(-barSize.width / 2 + cellDimensions.width / 2, 0);
        
        for (int i=0; i<cellsCount; i++) {
            SKSpriteNode *cell = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:cellDimensions];
            cell.position = cellPosition;
            cell.name = [NSString stringWithFormat:@"enemy cell - %d", i];
            
            [enemiesBar addChild:cell];
            
            cellPosition.x += cellDimensions.width + cellRightMargin;
        }
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInNode:enemiesBar];
    
    SKNode *touchedCell = [enemiesBar nodeAtPoint:loc];
    NSLog(@"tapped on enemey - %@", touchedCell.name);
}
@end
