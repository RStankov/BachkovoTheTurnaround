//
//  BTTBattleshipSpriteNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleshipSpriteNode.h"

@interface BTTBattleshipSpriteNode ()

@property (nonatomic, strong) NSArray *leftTextures;
@property (nonatomic, strong) NSArray *rightTextures;
@property (nonatomic, strong) NSArray *upTextures;
@property (nonatomic, strong) NSArray *downTextures;

@end

@implementation BTTBattleshipSpriteNode

- (instancetype)init {
    self = [super init];

    if (self) {
        self.rightTextures = [self loadFramesFor:@"right"];
        self.leftTextures  = [self loadFramesFor:@"left"];
        self.upTextures    = [self loadFramesFor:@"up"];
        self.downTextures  = [self loadFramesFor:@"down"];

        SKTexture *texture = [self.rightTextures firstObject];

        self.texture = texture;
        self.size = texture.size;

        [self driveRight];
    }

    return self;
}

- (void)driveUp {
  [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.upTextures timePerFrame:0.1 resize:NO restore:YES]] withKey:@"direction"];
}

- (void)driveDown {
  [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.downTextures timePerFrame:0.1 resize:NO restore:YES]] withKey:@"direction"];
}

- (void)driveRight {
  [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.rightTextures timePerFrame:0.1 resize:NO restore:YES]] withKey:@"direction"];
}

- (void)driveLeft {
  [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.leftTextures timePerFrame:0.1 resize:NO restore:YES]] withKey:@"direction"];
}

- (NSArray *)loadFramesFor:(NSString *)direction {
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:[@"battleship_" stringByAppendingString:direction]];
    NSMutableArray *frames = [NSMutableArray array];

    NSInteger numImages = atlas.textureNames.count;
    for (NSInteger i=1; i <= numImages/2; i++) {
        NSString *textureName = [NSString stringWithFormat:@"battleship_%@_000%ld", direction, (long)i];
        SKTexture *temp = [atlas textureNamed:textureName];
        [frames addObject:temp];
    }
    return frames;
}

- (void)moveTo:(NSArray *)points {
    if (points.count == 0) {
        return;
    }

    NSMutableArray *array = [NSMutableArray array];

    CGPoint previous = CGPointZero;

    for (NSValue *value in points) {
        CGPoint point = [value CGPointValue];

        if (array.count > 0) {
            if (point.x < previous.x) {
                [array addObject:[SKAction runBlock:^{
                    [self driveLeft];
                }]];
            } else if (point.x > previous.x) {
                [array addObject:[SKAction runBlock:^{
                    [self driveRight];
                }]];
            } else if (point.y < previous.y) {
                [array addObject:[SKAction runBlock:^{
                    [self driveDown];
                }]];
            } else if (point.y > previous.y) {
                [array addObject:[SKAction runBlock:^{
                    [self driveUp];
                }]];
            }
        }

        [array addObject:[SKAction moveTo:point duration:0.2]];

        previous = point;
    }

    [self runAction:[SKAction sequence:array] withKey:@"movement"];
}

@end
