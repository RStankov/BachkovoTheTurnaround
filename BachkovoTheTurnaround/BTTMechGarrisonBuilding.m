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


-(SKShapeNode *) render:(SKNode *) parent {
    SKShapeNode* mechBuilding = [SKShapeNode node];
    UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
    [topLeftBezierPath moveToPoint:CGPointMake(0.0, 0.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(0.0, 50.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(50.0, 100.0)];
    mechBuilding.path = topLeftBezierPath.CGPath;
    mechBuilding.lineWidth = 5.0;
    mechBuilding.fillColor = [UIColor redColor];
    mechBuilding.strokeColor = [UIColor redColor];
    mechBuilding.antialiased = NO;
    mechBuilding.position = CGPointMake(CGRectGetMidX(parent.frame), CGRectGetMidY(parent.frame) - 50);
    return mechBuilding;
}

@end
