//
//  BTTMap.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMap.h"

@interface BTTMap ()

@property (nonatomic, strong) NSArray *realMap;
@property (nonatomic, strong) NSDictionary *colors;

@end

@implementation BTTMap

- (instancetype)init {
    self = [super init];

    if (self) {
        NSString *_ = @"1";
        NSString *o = @"0";

        self.realMap = @[
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, o, o, o, o, o, _, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, o, o, o, o, o, o, o, o, _, _, _, o, o, o, _, _, _, _, _, _, o, o, o, _, _, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, _, _, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, _, _, _, _, _, _, o, _, _, o, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, _, _, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o, _, _, _, _, _, o, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, _, _, _, _, o, o, o, o, o, o, o, o, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, _, _, o, o, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, o, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, _, _, _, _, _, _, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
        ];
    }

    self.colors = @{
        @"1": [SKColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.9],
        @"0": [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9],
    };

    return self;
}

- (CGSize)size {
    return CGSizeMake(self.horizontalTileCount * self.tileSize, self.verticalTilesCount * self.tileSize);
}

- (SKSpriteNode *)nodeForIndexPath:(NSIndexPath *)indexPath {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];

    label.text = [self labelForIndexPath:indexPath];
    label.fontSize = 10;
    label.position = CGPointMake(0, 0i);

    SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];

//    sprite.color = [SKColor colorWithRed:(1.0 * indexPath.item)/30.0 green:(1.0 * (arc4random() % 74)) / 74 blue:(1.0*indexPath.section)/40.0 alpha:2.0];
    sprite.color = self.colors[label.text];
    sprite.colorBlendFactor = 0.9;
    

    [sprite addChild:label];

    return sprite;
}

- (NSString *)labelForIndexPath:(NSIndexPath *)indexPath {
    return (NSString *) ((NSArray *)self.realMap[indexPath.section])[indexPath.item];
}

- (NSArray *)availablePositionsAround:(NSIndexPath *)indexPath {
	NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:4];

	// Top
	NSIndexPath *p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section - 1];
	if ([self isValidTileCoord:p] && [self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Left
	p = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
	if ([self isValidTileCoord:p] && [self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Bottom
	p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section + 1];
	if ([self isValidTileCoord:p] && [self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Right
	p = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
	if ([self isValidTileCoord:p] && [self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	return [NSArray arrayWithArray:tmp];
}

- (BOOL)isValidTileCoord:(NSIndexPath *)indexPath {
    if (indexPath.item < 0) {
        return NO;
    }
    
    if (indexPath.section < 0) {
        return NO;
    }
    
    if (indexPath.section >= self.realMap.count) {
        return NO;
    }
    
    if (indexPath.item >= ((NSArray *)self.realMap[indexPath.section]).count) {
        return NO;
    }
    
    return YES;
}

-(BOOL)canVisitIndexPath:(NSIndexPath *)path {
    NSString *label = [self labelForIndexPath:path];
    return [label isEqualToString:@"1"];
}

@end
