//
//  BTTMapScene.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapScene.h"
#import "BTTPathFinder.h"

@interface BTTMapScene ()

@property (nonatomic) CGPoint scrollPoint;
@property (nonatomic, strong) SKNode *mapNode;
@property (nonatomic, strong) BTTMap *map;
@property (nonatomic, strong) SKSpriteNode *battleship;
@property (nonatomic) NSInteger currentX;
@property (nonatomic) NSInteger currentY;

@end

@implementation BTTMapScene

- (instancetype) initWithMap:(BTTMap *)map size:(CGSize) size {
    if (self = [self initWithSize:size]) {
        self.map = map;

        _currentX = 0;
        _currentY = 0;

        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];

        myLabel.text = @"World map";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - myLabel.fontSize);

        SKNode *mapNode = [[SKNode alloc] init];

        self.mapNode = mapNode;

        for (NSInteger i = 0; i<map.horizontalTileCount; i++) {
            for (NSInteger j = 0; j<map.verticalTilesCount; j++) {
                SKSpriteNode *sprite = [map tileNodeForTop:i left:j];
                sprite.position = [self pointForTop:i left:j];
                [mapNode addChild:sprite];
            }
        }
        
        self.anchorPoint = CGPointMake(0.5, 0.5);

        [self addChild:mapNode];
        
        SKSpriteNode *ship = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
        ship.color = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        ship.colorBlendFactor = 0.3;
        
        self.battleship = ship;
        self.battleship.position = [self pointForTop:0 left:0];
        
        [self.mapNode addChild:self.battleship];

        [self addChild:myLabel];
    }

    return self;
}

- (void) centerOnNode: (SKNode *) node
{
    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x,                                       node.parent.position.y - cameraPositionInScene.y);
}

- (void) didSimulatePhysics
{
    [self centerOnNode: self.battleship];
}

- (CGPoint) pointForTop:(NSInteger)x left:(NSInteger)y {
    return CGPointMake((0.5 + x) * self.map.tileSize, self.frame.size.height - (0.5 + y) * self.map.tileSize);
}

- (void) setScrollPosition:(CGPoint)point {
    self.scrollPoint = CGPointMake(point.x * -1, point.y);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self.mapNode];

    int x = floor(point.x / 45);
    int y = floor((self.size.height - point.y) / 45);

    NSArray *steps = [[[BTTPathFinder alloc] init] moveTowardFrom:[NSIndexPath indexPathForItem:_currentX
                                                                                      inSection:_currentY]
                                                               to:[NSIndexPath indexPathForItem:x
                                                                                      inSection:y]];
    NSMutableArray *array = [NSMutableArray array];

    for (NSIndexPath *idx in steps) {
        [array addObject:[SKAction moveTo:[self pointForTop:idx.item left:idx.section] duration:0.2]];
    }

    SKAction *action = [SKAction sequence:array];

    _currentY = y;
    _currentX = x;
    
    [self.battleship runAction:action];
}

- (void) update:(CFTimeInterval)currentTime {
    self.mapNode.position = self.scrollPoint;
}

@end
