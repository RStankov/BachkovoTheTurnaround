//
//  BTTBattleScene.h
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BTTBattleScene : SKScene

@property (nonatomic, strong) SKScene *parentScene;

-(instancetype)initWithEnemies:(NSArray *)enemies size:(CGSize) size;

@end
