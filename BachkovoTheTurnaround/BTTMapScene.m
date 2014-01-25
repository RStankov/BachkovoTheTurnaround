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

@property (nonatomic, strong) SKNode *mapNode;
@property (nonatomic, strong) BTTMap *map;
@property (nonatomic, strong) SKSpriteNode *playerNode;
@property (nonatomic, strong) BTTPathFinder *pathFinder;

@end

@implementation BTTMapScene

- (instancetype) initWithMap:(BTTMap *)map size:(CGSize) size {
    self = [self initWithSize:size];

    if (self) {
        self.map = map;
        self.pathFinder = [[BTTPathFinder alloc] initWithDataSource:map];
        self.anchorPoint = CGPointMake(0.5, 0.5);

        self.mapNode = [[SKSpriteNode alloc] initWithImageNamed:@"WorldMap-40x30.jpg"];

        for (NSInteger i = 0; i<map.verticalTilesCount; i++) {
            for (NSInteger j = 0; j<map.horizontalTileCount; j++) {
                SKSpriteNode *sprite = [map nodeForIndexPath:[NSIndexPath indexPathForItem:i inSection:j]];
                sprite.position = [self pointForTop:i left:j];
                [self.mapNode addChild:sprite];
            }
        }

        [self addChild:self.mapNode];

        self.playerNode = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
        self.playerNode.position = [self pointForTop:4 left:5];
        self.playerNode.color = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        self.playerNode.colorBlendFactor = 0.3;

        [self.mapNode addChild:self.playerNode];
    }

    return self;
}

- (void)didSimulatePhysics
{
    CGPoint cameraPositionInScene = [self convertPoint:self.playerNode.position fromNode:self.mapNode];
    self.mapNode.position = CGPointMake(self.mapNode.position.x - cameraPositionInScene.x, self.mapNode.position.y - cameraPositionInScene.y);
}

- (CGPoint) pointForTop:(NSInteger)x left:(NSInteger)y {
    return CGPointMake((0.5 + x) * self.map.tileSize, self.frame.size.height - (0.5 + y) * self.map.tileSize);
}

- (NSIndexPath *)indexPathForPoint:(CGPoint)point {
   return [NSIndexPath indexPathForItem:floor(point.x / self.map.tileSize) inSection:floor((self.size.height - point.y) / self.map.tileSize)];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self.mapNode];

    NSIndexPath *newIndex = [self indexPathForPoint:point];
    NSIndexPath *currentPath = [self indexPathForPoint:self.playerNode.position];

    NSArray *steps = [self.pathFinder shortestPathFrom:currentPath to:newIndex];

    if (steps.count == 0) {
        return;
    }

    [self.playerNode removeAllActions];

    NSMutableArray *array = [NSMutableArray array];

    for (NSIndexPath *idx in steps) {
        [array addObject:[SKAction moveTo:[self pointForTop:idx.item left:idx.section] duration:0.2]];
    }

    [self.playerNode runAction:[SKAction sequence:array]];
}

- (void) update:(CFTimeInterval)currentTime {
}

@end
