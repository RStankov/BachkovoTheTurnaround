//
//  BTTMainBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Genadi Samokovarov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMainBuilding.h"

@implementation BTTMainBuilding

+ (NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Main Building";
    });
    
    return name;
}

-(SKShapeNode *) render:(SKNode *) parent {
    SKShapeNode* mechBuilding = [SKShapeNode node];
    UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
    [topLeftBezierPath moveToPoint:CGPointMake(0.0, 0.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(0.0, 50.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(25.0, 100.0)];
    [topLeftBezierPath addLineToPoint:CGPointMake(25.0, 100.0)];

    mechBuilding.path = topLeftBezierPath.CGPath;
    mechBuilding.lineWidth = 5.0;
    mechBuilding.fillColor = [UIColor redColor];
    mechBuilding.strokeColor = [UIColor redColor];
    mechBuilding.antialiased = NO;
    mechBuilding.position = CGPointMake(CGRectGetMidX(parent.frame), CGRectGetMidY(parent.frame));
    return mechBuilding;
}

@end
