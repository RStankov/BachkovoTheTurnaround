//
//  BTTMapScene.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapScene.h"
#import "BTTPathFinder.h"
#import "BTTBattleshipSpriteNode.h"

@interface BTTMapScene ()

@property (nonatomic, strong) SKSpriteNode *mapNode;
@property (nonatomic, strong) BTTMap *map;
@property (nonatomic, strong) BTTBattleshipSpriteNode *playerNode;
@property (nonatomic, strong) BTTPathFinder *pathFinder;

@property (nonatomic, strong) NSArray *battleshipLeftTextures;

@end

@implementation BTTMapScene

- (instancetype) initWithMap:(BTTMap *)map size:(CGSize) size {
    self = [self initWithSize:size];

    if (self) {
        self.map = map;
        self.anchorPoint = CGPointMake(0.0, 1.0);
        self.pathFinder = [[BTTPathFinder alloc] initWithDataSource:map];

        self.mapNode = [[SKSpriteNode alloc] initWithImageNamed:@"world_debug"];
        self.mapNode.anchorPoint = CGPointMake(0.0, 1.0);
        self.mapNode.position = CGPointZero;

        [self addChild:self.mapNode];
/*
        [self.map enumerateSpriteNodes:^(NSIndexPath *indexPath, SKSpriteNode *spriteNode) {
            spriteNode.position = [self pointForIndexPath:indexPath];
            [self.mapNode addChild:spriteNode];
        }];
*/

        [self.map enumerateInteractableSpriteNodes:^(NSIndexPath *indexPath, SKSpriteNode *spriteNode) {
            spriteNode.position = [self pointForIndexPath:indexPath];
            [self.mapNode addChild:spriteNode];
        }];

        self.playerNode = [BTTBattleshipSpriteNode new];
        self.playerNode.position = [self pointForIndexPath:[NSIndexPath indexPathForItem:11 inSection:25]];

        [self.mapNode addChild:self.playerNode];
    }

    return self;
}

- (void)didSimulatePhysics
{
    CGPoint cameraPositionInScene = [self convertPoint:self.playerNode.position fromNode:self.mapNode];
    self.mapNode.position = CGPointMake(self.mapNode.position.x - cameraPositionInScene.x + self.size.width / 2, self.mapNode.position.y - cameraPositionInScene.y - self.size.height / 2);
}

- (CGPoint) pointForIndexPath:(NSIndexPath *)indexPath {
    return CGPointMake((0.5 + indexPath.item) * self.map.tileSize,  - (0.5 + indexPath.section) * self.map.tileSize);
}

- (NSIndexPath *)indexPathForPoint:(CGPoint)point {
    NSInteger x = floor(point.x/self.map.tileSize);
    NSInteger y = floor(- point.y / self.map.tileSize);

    return [NSIndexPath indexPathForItem:x inSection:y];
}

- (void)highlight:(CGPoint) point color:(UIColor *)color {
    NSString *emitterFileName = @"map_tile_tap";

    NSString *emitterPath = [[NSBundle mainBundle] pathForResource:emitterFileName ofType:@"sks"];
    SKEmitterNode *emitterNode = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];

    emitterNode.particlePosition = point;
    emitterNode.particlePositionRange = CGVectorMake(5, 5);
    emitterNode.scale = 0;
    emitterNode.particleColor = color;

    [self.mapNode addChild:emitterNode];

    [emitterNode runAction:[SKAction sequence:@[
                                                [SKAction scaleTo:1 duration:0.1],
                                                [SKAction waitForDuration:0.1],
                                                [SKAction scaleTo:0 duration:0.1],
                                                [SKAction removeFromParent]
                                                ]]];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self.mapNode];

    NSIndexPath *newIndex = [self indexPathForPoint:point];
    NSIndexPath *currentPath = [self indexPathForPoint:self.playerNode.position];

    if ([self.map isHittingInteractableObjectAt:newIndex from:currentPath]) {
        NSLog(@"DO SOMETHING!");
    }

    NSArray *steps = [self.pathFinder shortestPathFrom:currentPath to:newIndex];

    NSMutableArray *points = [NSMutableArray array];
    for (NSIndexPath *idx in steps) {
        [points addObject:[NSValue valueWithCGPoint:[self pointForIndexPath:idx]]];
    }

    if (points.count > 0) {
        [self highlight:[[points lastObject] CGPointValue] color:[UIColor yellowColor]];
    } else {
        [self highlight:[self pointForIndexPath:newIndex] color:[UIColor redColor]];
    }

    [self.playerNode moveTo:points];
}

- (void) update:(CFTimeInterval)currentTime {
}

@end
