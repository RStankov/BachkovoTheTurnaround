//
//  BTTMapCrystal.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapCrystal.h"

@interface BTTMapCrystal ()

@property (nonatomic) NSInteger amount;

@end

@implementation BTTMapCrystal

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath amount:(NSInteger)amount {
    self = [self initWithIndexPath:indexPath];
    
    if (self) {
        self.amount = amount;
    }
    
    return self;
}

- (SKSpriteNode *)generateSpriteNode {
    return [[SKSpriteNode alloc] initWithImageNamed:@"red_crystal"];
}

- (void)interactWithPlayer:(BTTPlayer *)player {
    player.credits += self.amount;
    [BTTMapInteractableObject flashText:[NSString stringWithFormat:@"+%ld", self.amount] overNode:self.spriteNode];
    [super interactWithPlayer:player];
}

@end
