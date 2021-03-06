//
//  BTTMap.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "BTTPathFinder.h"
#import "BTTMapInteractableObject.h"


typedef void(^BTTPMapSpriteiNodeNandler)(NSIndexPath *indexPath, SKSpriteNode *spriteNode);

@interface BTTMap : NSObject <BTTPathFinderDataSource, BTTMapInteractableObjectDelegate>

@property (nonatomic) NSInteger tileSize;

- (void)enumerateSpriteNodes:(BTTPMapSpriteiNodeNandler)handler;
- (void)enumerateInteractableSpriteNodes:(BTTPMapSpriteiNodeNandler)handler;

- (BOOL)isHittingInteractableObjectAt:(NSIndexPath *)indexPath from:(NSIndexPath *)playerPositionIndexPath;
- (void)hitIteractibleObjectAtIndexPath:(NSIndexPath *)indexPath;

@end
