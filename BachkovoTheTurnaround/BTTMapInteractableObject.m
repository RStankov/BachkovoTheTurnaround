//
//  BTTMapInteractableObject.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapInteractableObject.h"

@interface BTTMapInteractableObject ()

@property (nonatomic, strong) NSIndexPath *position;
@property (nonatomic, strong) SKSpriteNode *sprite;

@end

@implementation BTTMapInteractableObject

+ (void)flashText:(NSString *)string overNode:(SKSpriteNode *)node {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
    label.text = string;
    label.fontSize = 10;
    label.position = node.position;
    label.color = [UIColor yellowColor];

    [node.parent addChild:label];
    
    [label runAction:[SKAction sequence:@[
                                          [SKAction group:@[
                                                            [SKAction scaleTo:20 duration:0.4],
                                                            [SKAction rotateToAngle:40 duration:0.3],
                                                            [SKAction fadeAlphaTo:0 duration:0.35]
                                                            ]],
                                          [SKAction removeFromParent],
                                          ]]];
}

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = [self init];
    
    if (self) {
        self.position = indexPath;
        self.sprite   = [self generateSpriteNode];
    }

    return self;
}

- (NSIndexPath *)indexPath {
    return self.position;
}

- (SKSpriteNode *)spriteNode {
    return self.sprite;
}

- (SKSpriteNode *)generateSpriteNode {
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"HelveticaLight"];
    
    label.text = [NSString stringWithFormat:@"%0.2ldx%0.2ld", (long)self.indexPath.item, (long)self.indexPath.section];
    label.fontSize = 10;
    label.position = CGPointMake(0, 0);
    
    SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"square"];
    
    sprite.color = [SKColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
    sprite.colorBlendFactor = 1.0;
    sprite.alpha = 0.2;
    
    [sprite addChild:label];

    return sprite;
}

@end
