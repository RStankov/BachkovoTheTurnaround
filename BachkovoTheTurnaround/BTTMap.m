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
        self.realMap = @[
            @[@"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"t", @"t", @"m", @"m", @"m", @"r", @"d", @"d", @"d", @"d", @"r", @"m", @"m", @"m", @"t", @"C", @"t", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"d", @"d", @"d", @"d", @"d", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"d", @"d", @"d", @"r", @"r", @"r", @"d", @"d", @"d", @"d", @"d", @"b", @"r", @"m", @"m", @"d", @"d", @"t", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"r", @"d", @"d", @"d", @"d", @"d", @"r", @"m", @"m", @"m", @"r", @"d", @"C", @"a", @"a", @"a", @"a", @"a", @"G", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"d", @"m", @"m", @"d", @"d", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"r", @"d", @"d", @"d", @"b", @"d", @"d", @"r", @"m", @"m", @"m", @"r", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"m", @"m", @"r", @"d", @"d", @"d", @"d", @"a", @"d", @"m", @"d", @"d", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"r", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"r", @"m", @"m", @"m", @"r", @"d", @"a", @"d", @"i", @"i", @"r", @"m", @"m", @"m", @"r", @"d", @"d", @"d", @"a", @"d", @"m", @"d", @"r", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"t", @"t", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"m", @"m", @"m", @"d", @"d", @"a", @"d", @"i", @"i", @"i", @"r", @"m", @"m", @"r", @"r", @"d", @"d", @"a", @"d", @"d", @"d", @"r", @"r", @"r", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"t", @"t", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"m", @"m", @"d", @"d", @"d", @"a", @"d", @"d", @"i", @"i", @"i", @"r", @"m", @"d", @"d", @"d", @"d", @"a", @"d", @"d", @"d", @"t", @"t", @"t", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"t", @"t", @"d", @"d", @"d", @"C", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"a", @"d", @"d", @"d", @"i", @"i", @"r", @"m", @"d", @"d", @"p", @"p", @"a", @"d", @"d", @"d", @"d", @"t", @"r", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"t", @"d", @"d", @"d", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"p", @"Z", @"d", @"i", @"i", @"r", @"m", @"r", @"d", @"p", @"Z", @"a", @"a", @"a", @"a", @"a", @"t", @"r", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"t", @"d", @"H", @"d", @"d", @"d", @"d", @"r", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"t", @"d", @"d", @"d", @"i", @"i", @"m", @"m", @"r", @"t", @"d", @"d", @"d", @"d", @"d", @"s", @"a", @"r", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"r", @"d", @"d", @"d", @"d", @"d", @"r", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"t", @"t", @"d", @"i", @"m", @"m", @"m", @"m", @"t", @"t", @"i", @"i", @"i", @"s", @"s", @"a", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"r", @"i", @"i", @"d", @"d", @"r", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"i", @"i", @"r", @"r", @"G", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"i", @"i", @"i", @"i", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"a", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"i", @"i", @"i", @"i", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"m", @"t", @"t", @"t", @"m", @"m", @"d", @"d", @"a", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"i", @"i", @"i", @"i", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"t", @"d", @"d", @"d", @"d", @"d", @"a", @"i", @"i", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"m", @"m", @"d", @"d", @"C", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"i", @"i", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"t", @"t", @"t", @"t", @"m", @"r", @"r", @"d", @"m", @"r", @"r", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"a", @"d", @"d", @"i", @"i", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"C", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"p", @"p", @"p", @"d", @"i", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"d", @"d", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"a", @"d", @"d", @"t", @"i", @"i", @"d", @"d", @"p", @"X", @"p", @"d", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"t", @"t", @"d", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"t", @"t", @"t", @"i", @"i", @"i", @"d", @"p", @"p", @"p", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"d", @"d", @"d", @"t", @"t", @"t", @"t", @"t", @"i", @"i", @"i", @"i", @"d", @"r", @"m", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"t", @"t", @"t", @"r", @"m", @"m", @"r", @"d", @"d", @"a", @"d", @"d", @"b", @"d", @"d", @"d", @"t", @"t", @"t", @"t", @"t", @"t", @"t", @"i", @"m", @"m", @"d", @"d", @"r", @"r", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"t", @"p", @"p", @"p", @"d", @"s", @"s", @"d", @"d", @"a", @"d", @"d", @"d", @"d", @"d", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"d", @"d", @"d", @"t", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"t", @"p", @"Q", @"p", @"p", @"a", @"a", @"a", @"a", @"a", @"d", @"d", @"d", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"d", @"d", @"b", @"t", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"p", @"p", @"p", @"s", @"d", @"d", @"d", @"s", @"s", @"s", @"d", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"C", @"t", @"t", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"r", @"r", @"d", @"s", @"d", @"s", @"d", @"d", @"d", @"d", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"r", @"r", @"m", @"m", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"m", @"o", @"o", @"o"],
            @[@"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o", @"o"],
            ];
    }

    self.colors = @{
         @"a": [SKColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.9],
         @"d": [SKColor colorWithRed:0.0 green:0.9 blue:0.0 alpha:0.9],
 
         @"o": [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9],
         @"g": [SKColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:0.9],
         @"m": [SKColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.9],
         @"t": [SKColor colorWithRed:0.0 green:0.0 blue:0.4 alpha:0.9],
         @"r": [SKColor colorWithRed:0.0 green:0.0 blue:0.9 alpha:0.9],
         @"i": [SKColor colorWithRed:0.0 green:0.0 blue:0.7 alpha:0.9],
         @"b": [SKColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:0.9],
         @"s": [SKColor colorWithRed:0.1 green:0.6 blue:0.1 alpha:0.9],
         @"p": [SKColor colorWithRed:0.7 green:0.2 blue:0.2 alpha:0.9],
         @"C": [SKColor colorWithRed:0.8 green:0.1 blue:0.1 alpha:0.9],
         @"Q": [SKColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9],
         @"Z": [SKColor colorWithRed:0.7 green:0.4 blue:0.4 alpha:0.9],
         @"G": [SKColor colorWithRed:0.7 green:0.0 blue:0.0 alpha:0.9],
         @"H": [SKColor colorWithRed:0.4 green:0.0 blue:0.0 alpha:0.9],
         @"X": [SKColor colorWithRed:0.2 green:0.0 blue:0.0 alpha:0.9],
         @":": [SKColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9],
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

    return [label isEqualToString:@"a"] || [label isEqualToString:@"d"];
}

@end
