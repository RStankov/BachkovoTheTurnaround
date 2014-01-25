//
//  BTTMap.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMap.h"


@implementation BTTMap

- (CGSize)size {
    return CGSizeMake(self.horizontalTileCount * self.tileSize, self.verticalTilesCount * self.tileSize);
}

- (SKSpriteNode *)tileNodeForTop:(NSInteger)i left:(NSInteger)j {
    SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];

    sprite.color = [SKColor colorWithRed:(1.0 * i)/30.0 green:(1.0 * (arc4random() % 74)) / 74 blue:(1.0*j)/40.0 alpha:2.0];
    sprite.colorBlendFactor = 0.3;
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
    
    label.text = [NSString stringWithFormat:@"%dx%d", i, j];
    label.fontSize = 10;
    label.position = CGPointMake(0, 0);
    
    [sprite addChild:label];
    
    return sprite;
}

@end