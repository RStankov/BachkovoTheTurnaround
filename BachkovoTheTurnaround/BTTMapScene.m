//
//  BTTMapScene.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapScene.h"

@interface BTTMapScene ()

@property (nonatomic) CGPoint scrollPoint;
@property (nonatomic, strong) SKNode *map;

@end

@implementation BTTMapScene

- (instancetype)initWithMap:(BTTMap *)map size:(CGSize) size {
    self = [self initWithSize:size];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
        
        myLabel.text = @"World map";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - myLabel.fontSize);
        
        SKNode *mapNode = [[SKNode alloc] init];
        
        self.map = mapNode;
        
        for(NSInteger i=0; i<map.horizontalTileCount; i++) {
            for(NSInteger j=0; j<map.verticalTilesCount; j++) {
                SKSpriteNode *sprite = [map tileNodeForTop:i left:j];
                sprite.position = CGPointMake((0.5 + i) * map.tileSize, self.frame.size.height - (0.5 + j) * map.tileSize);
                [mapNode addChild:sprite];
            }
        }
        
        [self addChild:mapNode];
        [self addChild:myLabel];
    }
    
    return self;
}

- (void)setScrollPosition:(CGPoint)point {
    self.scrollPoint = CGPointMake(point.x * -1, point.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"aloha");
}

-(void)update:(CFTimeInterval)currentTime {
    self.map.position = self.scrollPoint;
}

@end
