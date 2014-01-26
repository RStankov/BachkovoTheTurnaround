//
//  BTTMapTreasure.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapTreasure.h"

@interface BTTMapTreasure ()

@property (nonatomic) NSInteger amount;

@end

@implementation BTTMapTreasure

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath amount:(NSInteger)amount {
    self = [self initWithIndexPath:indexPath];
    
    if (self) {
        self.amount = amount;
    }
    
    return self;
}

- (SKSpriteNode *)generateSpriteNode {
    return [SKSpriteNode spriteNodeWithImageNamed:@"treasure"];
}

- (void)interactWithPlayer:(BTTPlayer *)player {
    player.credits += self.amount;
    [BTTMapInteractableObject flashText:[NSString stringWithFormat:@"+%ld", self.amount] overNode:self.spriteNode];
    [super interactWithPlayer:player];
}

@end
