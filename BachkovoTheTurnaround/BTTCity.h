//
//  BTTMyCity.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BTTPlayer.h"
#import "BTTMapScene.h"

@interface BTTCity : SKScene

- (void) heroVisit: (BTTPlayer *) character;

@property (nonatomic, strong) NSMutableArray *buildings;
@property (nonatomic, strong) SKScene *parentScene;

@end
