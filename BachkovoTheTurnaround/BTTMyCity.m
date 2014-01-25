//
//  BTTMyCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMyCity.h"
#import "BTTBuilding.h"
#import "BTTMechGarrisonBuilding.h"
@implementation BTTMyCity

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
       
        BTTMechGarrisonBuilding *mechBuilding = [[BTTMechGarrisonBuilding alloc] init];
        [self completeBuilding:mechBuilding ];
        [self addChild:myLabel];
    }
    return self;
}

- (void) heroVisit: (SKTexture *) character {
    // Whatever this will do.
}

- (void) completeBuilding: (BTTBuilding *) building {
    NSLog(@"Building...");
    [self.buildingsCompleted addObject:building];
    SKNode *stageBuilding = [building render:self];
    NSLog(@"%@", NSStringFromCGRect(stageBuilding.frame));
    [self addChild:stageBuilding];
}

@end
