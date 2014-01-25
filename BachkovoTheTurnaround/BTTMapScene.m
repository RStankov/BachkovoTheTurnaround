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
@property (nonatomic, strong) BTTPathFinder *pathFinder;
@property (nonatomic, strong) NSIndexPath *selectedIndex;

@end

@implementation BTTMapScene

- (instancetype) initWithMap:(BTTMap *)map size:(CGSize) size {
    if (self = [self initWithSize:size]) {
        self.map = map;

        self.pathFinder = [[BTTPathFinder alloc] initWithDataSource:map];

        self.selectedIndex = [NSIndexPath indexPathForItem:0 inSection:0];

        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self.mapNode];

    NSIndexPath *newIndex = [NSIndexPath indexPathForItem:floor(point.x / 45) inSection:floor((self.size.height - point.y) / 45)];

    NSArray *steps = [self.pathFinder shortestPathFrom:self.selectedIndex to:newIndex];

    NSMutableArray *array = [NSMutableArray array];

    for (NSIndexPath *idx in steps) {
        [array addObject:[SKAction moveTo:[self pointForTop:idx.item left:idx.section] duration:0.2]];
    }

    SKAction *action = [SKAction sequence:array];

    self.selectedIndex = newIndex;

    [self.battleship runAction:action];
}

- (void) update:(CFTimeInterval)currentTime {
    self.mapNode.position = self.scrollPoint;
}

@end
