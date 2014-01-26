//
//  BTTMap.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMap.h"
#import "BTTMapInteractableObject.h"
#import "BTTMapCrystal.h"
#import "BTTMapTreasure.h"
#import "BTTWorld.h"

@interface BTTMap ()

@property (nonatomic, strong) NSArray *realMap;
@property (nonatomic, strong) NSDictionary *colors;
@property (nonatomic, strong) NSMutableArray *interactableObjects;

@end

@implementation BTTMap

- (instancetype)init {
    self = [super init];

    if (self) {
        NSString *_ = @"1";
        NSString *o = @"0";

        self.realMap = @[
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, o, o, o, o, o, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, _, _, _, _, _, _, o, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o, _, _, _, _, _, o, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, _, _, _, _, o, o, o, o, o, o, o, o, _, _, _, _, _, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, _, _, _, _, _, o, o, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, o, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, _, _, _, _, _, _, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, _, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, _, _, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, _, _, _, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, _, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, _, _, _, _, _, _, _, _, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
          @[o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o],
        ];

        self.colors = @{
                        @"1": [SKColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0],
                        @"0": [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0],
                        };
        
        self.tileSize = 44;

        self.interactableObjects = [NSMutableArray array];
        [self.interactableObjects addObject:[[BTTMapCrystal alloc] initWithIndexPath:[NSIndexPath indexPathForItem:15 inSection:22] amount:200]];
        [self.interactableObjects addObject:[[BTTMapTreasure alloc] initWithIndexPath:[NSIndexPath indexPathForItem:20 inSection:20] amount:1000]];
    }

    return self;
}

- (void)enumerateSpriteNodes:(BTTPMapSpriteiNodeNandler)handler {
    NSInteger cols = ((NSArray *)self.realMap[0]).count;
    NSInteger rows = self.realMap.count;

    for (NSInteger i = 0; i<cols; i++) {
        for (NSInteger j = 0; j < rows; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:j];

            SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];

            label.text = [NSString stringWithFormat:@"%0.2ldx%0.2ld", (long)indexPath.item, (long)indexPath.section];
            label.fontSize = 10;
            label.position = CGPointMake(0, 0);

            SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];

            sprite.color = self.colors[[self labelForIndexPath:indexPath]];
            sprite.colorBlendFactor = 1.0;
            sprite.alpha = 0.2;

            [sprite addChild:label];

            handler(indexPath, sprite);
        }
    }
}

- (void)enumerateInteractableSpriteNodes:(BTTPMapSpriteiNodeNandler)handler {
    for(BTTMapInteractableObject *object in self.interactableObjects) {
        handler(object.indexPath, object.spriteNode);
    }
}

- (NSString *)labelForIndexPath:(NSIndexPath *)indexPath {
    return (NSString *) ((NSArray *)self.realMap[indexPath.section])[indexPath.item];
}

- (NSArray *)availablePositionsAround:(NSIndexPath *)indexPath {
	NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:4];

	// Top
	NSIndexPath *p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section - 1];
	if ([self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Left
	p = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
	if ([self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Bottom
	p = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section + 1];
	if ([self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	// Right
	p = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
	if ([self canVisitIndexPath:p]) {
		[tmp addObject:p];
	}

	return [NSArray arrayWithArray:tmp];
}

-(BOOL)canVisitIndexPath:(NSIndexPath *)indexPath {
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

    if (![[self labelForIndexPath:indexPath] isEqualToString:@"1"]) {
        return NO;
    }
    
    if ([self indexOfInteractibleObjectByIndexPath:indexPath] != NSNotFound) {
        return NO;
    }

    return YES;
}

- (NSUInteger)indexOfInteractibleObjectByIndexPath:(NSIndexPath *)indexPath {
    for (NSInteger i = 0, c = self.interactableObjects.count; i < c; i++) {
        BTTMapInteractableObject *object = self.interactableObjects[i];
        if ([object.indexPath isEqual:indexPath]) {
            return i;
        }
    }

    return NSNotFound;
}

- (BOOL)isHittingInteractableObjectAt:(NSIndexPath *)indexPath from:(NSIndexPath *)playerPositionIndexPath {
    NSUInteger idx = [self indexOfInteractibleObjectByIndexPath:indexPath];

    if (idx == NSNotFound) {
        return NO;
    }

    NSInteger diffX = abs((int)(playerPositionIndexPath.item - indexPath.item));
    NSInteger diffY = abs((int)(playerPositionIndexPath.section - indexPath.section));

    return diffX != diffY && diffX <= 1 && diffY <= 1;
}

- (void)hitIteractibleObjectAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger idx = [self indexOfInteractibleObjectByIndexPath:indexPath];

    BTTMapInteractableObject *object = self.interactableObjects[idx];

    [object interactWithPlayer:[BTTWorld player]];

    [self.interactableObjects removeObjectAtIndex:idx];
}

@end
