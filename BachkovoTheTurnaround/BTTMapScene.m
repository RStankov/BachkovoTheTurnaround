//
//  BTTMapScene.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapScene.h"

@interface BTTMapScene ()

@property (nonatomic) CGPoint scrollPoint;
@property (nonatomic, strong) SKNode *mapNode;
@property (nonatomic, strong) BTTMap *map;
@property (nonatomic, strong) SKSpriteNode *battleship;

@end

@implementation BTTMapScene

- (instancetype)initWithMap:(BTTMap *)map size:(CGSize) size {
    self = [self initWithSize:size];
    
    if (self) {
        self.map = map;

        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
        
        myLabel.text = @"World map";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - myLabel.fontSize);
        
        SKNode *mapNode = [[SKNode alloc] init];

        self.mapNode = mapNode;
        
        for(NSInteger i=0; i<map.horizontalTileCount; i++) {
            for(NSInteger j=0; j<map.verticalTilesCount; j++) {
                SKSpriteNode *sprite = [map tileNodeForTop:i left:j];

                sprite.position = CGPointMake((0.5 + i) * map.tileSize, self.frame.size.height - (0.5 + j) * map.tileSize);
                [mapNode addChild:sprite];
            }
        }
        
        [self addChild:mapNode];
        
        
        SKSpriteNode *ship = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
        ship.color = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        ship.colorBlendFactor = 0.3;
        
        self.battleship = ship;
        
        [self addChild:myLabel];
    }
    
    return self;
}

- (CGPoint)pointForTop:(NSInteger)x Left:(NSInteger)y {
    return CGPointMake((0.5 + x) * self.map.tileSize, self.frame.size.height - (0.5 + y) * self.map.tileSize);
}

- (void)setScrollPosition:(CGPoint)point {
    self.scrollPoint = CGPointMake(point.x * -1, point.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self.mapNode];
    
    int x = floor(point.x/45);
    int y = floor((self.size.height - point.y)/45);
    
    self.battleship.position = [self pointForTop:x Left:y];
}

-(void)update:(CFTimeInterval)currentTime {
    self.mapNode.position = self.scrollPoint;
}

@end
