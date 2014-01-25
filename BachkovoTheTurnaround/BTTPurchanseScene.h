//
//  BTTPurchanseScene.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BTTPlayer.h"
#import "BTTUnit.h"

@interface BTTPurchanseScene : SKScene

- (instancetype) initWithUnits:(BTTUnit *)firstUnit second:(BTTUnit *)secondUnit;
@end
