//
//  BTTMechGarrisonBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMechGarrisonBuilding.h"

@implementation BTTMechGarrisonBuilding


+ (NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Mech Garrison";
    });
    
    return name;
}

-(void)buyUnit:(BTTUnit *)unit{
    //return [[BTTUnit alloc] init];
}


-(SKShapeNode *) render:(SKNode *)frame {
    SKShapeNode* mechBuilding = [SKShapeNode node];
    UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
    [topLeftBezierPath moveToPoint:CGPointMake(0.0, 0.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(0.0, 100.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(100.0, 100.0)];
    mechBuilding.path = topLeftBezierPath.CGPath;
    mechBuilding.lineWidth = 10.0;
    mechBuilding.fillColor = [UIColor redColor];
    mechBuilding.strokeColor = [UIColor redColor];
    mechBuilding.antialiased = NO;
    mechBuilding.position = CGPointMake(CGRectGetMidX(*frame), CGRectGetMidY(*frame));
    return mechBuilding;
}

@end
