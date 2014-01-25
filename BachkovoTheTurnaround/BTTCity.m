//
//  BTTMyCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTCity.h"
#import "BTTBuilding.h"
#import "BTTMainBuilding.h"
#import "BTTMechGarrisonBuilding.h"
#import "BTTPlayer.h"
#import "BTTReconMech.h"
#import "BTTLightMech.h"

@implementation BTTCity

- (id) initWithSize: (CGSize)size {
    if (self = [super initWithSize:size]) {
        BTTMainBuilding *main = [[BTTMainBuilding alloc] init];
        [self addBuilding:main];
        
        BTTMechGarrisonBuilding *mech = [[BTTMechGarrisonBuilding alloc] init];
        [self addBuilding:mech];
        
        BTTPlayer *playa = [[BTTPlayer alloc] init];
        [self heroVisit:playa];
    }
    
    return self;
}

- (void) heroVisit: (BTTPlayer *) character {
    NSLog(@"%@", character.army);
}

- (void) addBuilding: (BTTBuilding *) building {
    [self.buildings addObject:building];
    SKNode * rendered = [building render:self];
    [self addChild:rendered];
}

- (SKSpriteNode *)fireButtonNode
{
    SKSpriteNode *fireNode = [SKSpriteNode spriteNodeWithImageNamed:@"download"];
    fireNode.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame) + 50);
    fireNode.name = @"createBuilding";
    fireNode.zPosition = 1.0;

    return fireNode;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"createBuilding"]) {
        NSLog(@"Building....");
        BTTMainBuilding *main = [[BTTMainBuilding alloc] init];
        BTTMechGarrisonBuilding *mech = [[BTTMechGarrisonBuilding alloc] init];
        [self addBuilding:main];
        [self addBuilding:mech];
    }
}


@end
