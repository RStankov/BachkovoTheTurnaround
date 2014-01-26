//
//  BTTBattleCardSpriteNode.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BTTUnit.h"

@interface BTTBattleCardNode : SKNode

- (void)setUnit:(BTTUnit *)unit;

- (void)redraw;
- (void)flip;
- (void)restore;
- (void)attackedBy:(BTTUnit *)unit;

@end
