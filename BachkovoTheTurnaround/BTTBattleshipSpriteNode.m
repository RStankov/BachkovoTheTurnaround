//
//  BTTBattleshipSpriteNode.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleshipSpriteNode.h"

@interface BTTBattleshipSpriteNode ()

@property (nonatomic, strong) NSArray *rightTextures;

@end

@implementation BTTBattleshipSpriteNode

- (instancetype)init {
    self = [super init];

    if (self) {
        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"battleship_right"];
        NSMutableArray *frames = [NSMutableArray array];

        int numImages = atlas.textureNames.count;
        for (int i=1; i <= numImages/2; i++) {
            NSString *textureName = [NSString stringWithFormat:@"battleship_right_000%d", i];
            SKTexture *temp = [atlas textureNamed:textureName];
            [frames addObject:temp];
        }
        self.rightTextures = frames;

        SKTexture *tex = [frames firstObject];

        self.texture = tex;
        self.size = tex.size;

        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.rightTextures timePerFrame:0.1 resize:NO restore:YES]] withKey:@"right"];
    }

    return self;
}

- (void)moveTo:(NSArray *)points {
    if (points.count == 0) {
        return;
    }

    [self removeActionForKey:@"movement"];

    NSMutableArray *array = [NSMutableArray array];

    for (NSValue *value in points) {
        CGPoint point = [value CGPointValue];
        [array addObject:[SKAction moveTo:point duration:0.2]];
    }

    [self runAction:[SKAction sequence:array] withKey:@"movement"];
}

@end
