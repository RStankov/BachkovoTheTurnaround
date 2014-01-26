//
//  BTTUnit.h
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BTTUnit : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic) NSInteger count;
@property(nonatomic) NSInteger attack;
@property(nonatomic) NSInteger defense;

@end
