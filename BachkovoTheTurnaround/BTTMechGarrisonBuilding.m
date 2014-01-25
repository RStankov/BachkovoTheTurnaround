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


-(SKSpriteNode *) render:(SKNode *) parent {
    SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
    sprite.color = [SKColor colorWithRed:(50.0) green:(1.0 * (arc4random() % 74)) / 74 blue:(1.0)/40.0 alpha:2.0];
    sprite.colorBlendFactor = 0.3;
    sprite.position = CGPointMake(CGRectGetMidX(self.frame) + 100, CGRectGetMidY(self.frame) + 100);
    
    return sprite;
}

@end
