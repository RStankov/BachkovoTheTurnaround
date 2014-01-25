//
//  BTTMechGarrisonBuilding.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBuilding.h"
#import "BTTUnit.h"

@interface BTTMechGarrisonBuilding : BTTBuilding
@property(nonatomic, assign) NSMutableArray *availableUnits;

-(void) buyUnit: (BTTUnit *)unit;
-(NSArray *) availableUnits;
-(SKNode *) render: (SKNode *)parent;
@end