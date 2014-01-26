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
#import "BTTMapScene.h"

@implementation BTTCity

- (id) initWithSize: (CGSize)size {
    if (self = [super initWithSize:size]) {
        self.anchorPoint = CGPointMake(0, 1 );
        
        SKSpriteNode *background  = [SKSpriteNode spriteNodeWithImageNamed:@"city"];
        background.anchorPoint = CGPointMake(0, 1);
        background.position = CGPointMake(0, 0);
        
        SKSpriteNode *leaveButton = [SKSpriteNode spriteNodeWithImageNamed:@"leave_city"];
        leaveButton.position = CGPointMake(482.5, -262.5);
        
        [self addChild:background];
        [self addChild:leaveButton];
        
        for(NSInteger i=0; i<3; i++) {
            int r = arc4random_uniform(3);
            NSLog(@"%d", r);
            NSString *randomUnit = [NSString stringWithFormat:@"unit_%d", r];
            SKSpriteNode *unit = [SKSpriteNode spriteNodeWithImageNamed:randomUnit];
        
            unit.position = CGPointMake(86 + 99 * i, -57);
            [self addChild:unit];
        }
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
    SKSpriteNode *fireNode = [SKSpriteNode spriteNodeWithImageNamed:@"leave_city"];
    fireNode.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame) + 50);
    fireNode.name = @"exitCity";
    fireNode.zPosition = 1.0;
    [self addChild:fireNode];
    return fireNode;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"exitCity"]) {
        NSLog(@"Exiting");
        //SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
        //BTTMapScene *mapScene = [self scene];
        //  Optionally, insert code to configure the new scene.
        //[self.scene.view presentScene: mapScene transition: reveal];
        
    }
}



@end
