//
//  BTTMyCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMyCity.h"
#import "BTTBuilding.h"

@implementation BTTMyCity

-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.10 green:0.5 blue:0.10 alpha:0.5];
        SKNode *mainBuilding = [[BTTBuilding alloc] initWithName:@"Main"];

        mainBuilding.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:mainBuilding];
    }
    return self;
}

-(NSMutableArray *) buildingsCompleted {
    return self.buildingsCompleted;
}

-(BTTBuilding *) buildBuilding:(BTTBuilding *) building{
    building.isBuild = true;
    return building;
}


@end
