//
//  BTTMapScene.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BTTMap.h";

@interface BTTMapScene : SKScene

- (instancetype)initWithMap:(BTTMap *)map size:(CGSize) size;

- (void)setScrollPosition:(CGPoint)point;

@end
