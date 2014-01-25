//
//  BTTMapScene.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapScene.h"

@implementation BTTMapScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
        
        myLabel.text = @"World map";
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
                
                [sprite addChild:label];
                
                [self addChild:sprite];
            }
        }
        
        
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"aloha");
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
