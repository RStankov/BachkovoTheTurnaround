//
//  BTTMapCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 26/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapCity.h"
#import "BTTCity.h"

@interface BTTMapCity ()

@property (nonatomic) NSInteger amount;

@end

@implementation BTTMapCity

- (instancetype) initWithIndexPath:(NSIndexPath *)indexPath amount:(NSInteger)amount {
    self = [self initWithIndexPath:indexPath];
    if (self) {
        self.amount = amount;
    }
    return self;
}

- (void) interactWithPlayer:(BTTPlayer *)player {
    [super interactWithPlayer:player];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    BTTCity *cityScene = [[BTTCity alloc] initWithSize:self.spriteNode.scene.view.bounds.size];
    [cityScene heroVisit:player];
    //  Optionally, insert code to configure the new scene.

    [self.spriteNode.scene.view presentScene: cityScene transition: reveal];
}

- (SKSpriteNode *)generateSpriteNode {
    return [[SKSpriteNode alloc] init];
}
@end
