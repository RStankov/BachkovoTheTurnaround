//
//  BTTMyCity.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BTTMyCity : SKScene

-(void)heroVisit: (SKTexture *)character;
-(SKNode *)buildBuilding: (SKNode *)buildingType;

@property(nonatomic, assign) NSMutableArray *buildingsCompleted;

@end
