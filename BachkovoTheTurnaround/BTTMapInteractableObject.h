//
//  BTTMapInteractableObject.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "BTTPlayer.h"

@interface BTTMapInteractableObject : NSObject

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPath;
- (SKSpriteNode *)spriteNode;
- (SKSpriteNode *)generateSpriteNode;
- (void)interactWithPlayer:(BTTPlayer *)player;

+ (void)flashText:(NSString *)string overNode:(SKSpriteNode *)node;

@end
