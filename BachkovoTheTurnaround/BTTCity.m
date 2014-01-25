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
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
       
       SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
       
       myLabel.text = @"City";
       myLabel.fontSize = 10;
       myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80);
       
       NSLog(@"%f", myLabel.position.y);
       
       NSInteger size = 44;
       for(NSInteger i=0; i<30; i++) {
           for(NSInteger j=0; j<40; j++) {
               SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
               
               sprite.position = CGPointMake(22 + size * i, CGRectGetMidY(self.frame) + 68 - size * j);
               
               NSLog(@"%@", NSStringFromCGSize(sprite.size));
               
               sprite.color = [SKColor colorWithRed:(1.0 * i)/30.0 green:(1.0 * (arc4random() % 74)) / 74 blue:(1.0*j)/40.0 alpha:2.0];
               sprite.colorBlendFactor = 0.3;
               
               SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
               
               label.text = [NSString stringWithFormat:@"%dx%d", i, j];
               label.fontSize = 10;
               label.position = CGPointMake(0, 0);
               
               [self addChild:sprite];
           }
        }
        BTTMainBuilding *main = [[BTTMainBuilding alloc] init];
        BTTMechGarrisonBuilding *mech = [[BTTMechGarrisonBuilding alloc] init];
        [self completeBuilding:main];
        [self completeBuilding:mech];

        [self addChild:myLabel];
    }
    return self;
}

- (void) heroVisit: (BTTPlayer *) character {
    BTTLightMech *lightMech = [[BTTLightMech alloc] init];
    BTTReconMech *reconMech = [[BTTReconMech alloc] init];
    
    [character.army addObject:lightMech];
    [character.army addObject:reconMech];
}

- (void) completeBuilding: (BTTBuilding *) building {
    [self.buildingsCompleted addObject:building];
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
        [self completeBuilding:main];
        [self completeBuilding:mech];
    }
}


@end
