//
//  BTTArmyBar.m
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTArmyBar.h"

static int CELL_RIGHT_MARGIN = 2;
static int BAR_WIDTH = 568;
static int BAR_HEIGHT = 40;

@interface BTTArmyBar() {
    int _slotsCount;
}

@property (nonatomic, strong) NSArray *units;

@end

@implementation BTTArmyBar

- (instancetype) initWithSlotsCount:(int)slotsCount units:(NSArray *)units {
    self = [self initWithColor:[UIColor greenColor] size:CGSizeMake(BAR_WIDTH, BAR_HEIGHT)];
    
    if (self) {
        _units = units;
        _slotsCount = slotsCount;

        [self drawSlots];
    }
    return self;
}

- (void) drawSlots {
    float cellWidth = (self.frame.size.width - ((_slotsCount - 1)) * CELL_RIGHT_MARGIN) / _slotsCount;
    CGSize cellDimensions = CGSizeMake(cellWidth, self.frame.size.height);
    CGPoint cellPosition = CGPointMake(-self.frame.size.width / 2 + cellDimensions.width / 2, 0);

    for (int i=0; i<_slotsCount; i++) {
        SKSpriteNode *cell = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:cellDimensions];
        cell.position = cellPosition;
        cell.name = [NSString stringWithFormat:@"cell - %d", i];
        
        [self addChild:cell];
        
        cellPosition.x += cellDimensions.width + CELL_RIGHT_MARGIN;
    }
}
@end
