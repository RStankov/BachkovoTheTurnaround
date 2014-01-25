//
//  BTTBuilding.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BTTBuilding : SKSpriteNode

@property bool *isBuild;
@property(nonatomic, copy) NSString *name;

+ (NSString *) name;

-(instancetype) initWithName: (NSString *) name;


@end
