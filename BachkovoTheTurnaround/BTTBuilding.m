//
//  BTTBuilding.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBuilding.h"

@implementation BTTBuilding

+ (NSString *) name {
    static dispatch_once_t once;
    static NSString *name;
    
    dispatch_once(&once, ^ {
        name = @"Use a subclass";
    });
    
    return name;
}

- (instancetype)initWithName:(NSString *)name {
    if(self = [super init]) {
        SKShapeNode* topLeft = [SKShapeNode node];
        UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
        [topLeftBezierPath moveToPoint:CGPointMake(0.0, 0.0)];
        [topLeftBezierPath addLineToPoint:CGPointMake(0.0, 100.0)];
        [topLeftBezierPath addLineToPoint:CGPointMake(100.0, 100.0)];
        topLeft.path = topLeftBezierPath.CGPath;
        topLeft.lineWidth = 5.0;
        topLeft.strokeColor = [UIColor redColor];
        topLeft.antialiased = NO;
        [self addChild:topLeft];
        
        SKShapeNode* bottomRight = [SKShapeNode node];
        UIBezierPath* bottomRightBezierPath = [[UIBezierPath alloc] init];
        [bottomRightBezierPath moveToPoint:CGPointMake(0.0, 0.0)];
        [bottomRightBezierPath addLineToPoint:CGPointMake(100.0, 0.0)];
        [bottomRightBezierPath addLineToPoint:CGPointMake(100.0, 100.0)];
        bottomRight.path = bottomRightBezierPath.CGPath;
        bottomRight.lineWidth = 5.0;
        bottomRight.strokeColor = [UIColor greenColor];
        bottomRight.antialiased = NO;
        [self addChild:bottomRight];
        self.name = name;
    }
    
    return self;
}


@end
