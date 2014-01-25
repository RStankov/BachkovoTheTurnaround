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

@interface BTTMap : NSObject <BTTPathFinderDataSource>

@property (nonatomic) NSInteger verticalTilesCount;
@property (nonatomic) NSInteger horizontalTileCount;
@property (nonatomic) NSInteger tileSize;

- (CGSize)size;

- (SKSpriteNode *)tileNodeForTop:(NSInteger)i left:(NSInteger)j;

@end
