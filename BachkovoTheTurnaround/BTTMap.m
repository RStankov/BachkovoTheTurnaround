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
    SKSpriteNode *node = [[SKSpriteNode alloc] init];
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
    
    label.text = [NSString stringWithFormat:@"%dx%d", i, j];
    label.fontSize = 10;
    label.position = CGPointMake(0, 0);
    
    [node addChild:label];
    
    return node;
}

- (NSArray *)availablePositionsAround:(NSIndexPath *)indexPath {
	NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:4];

	// Top
	NSIndexPath *p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section - 1];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}

	// Left
	p = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}

	// Bottom
	p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section + 1];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}

	// Right
	p = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}

	return [NSArray arrayWithArray:tmp];
}

- (BOOL)isValidTileCoord:(NSIndexPath *)tileCoord {
    int width = 100;
    int height = 100;
    return tileCoord.item >= 0 || tileCoord.section >= 0 || tileCoord.item <= width || tileCoord.section <= height;
}

-(BOOL)isWallAtTileCoord:(NSIndexPath *)path {
    return NO;
}

@end
