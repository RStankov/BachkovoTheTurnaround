//
//  BTTMapTreasure.h
//  BachkovoTheTurnaround
//
//  Created by Vitaliy Berov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapInteractableObject.h"

@interface BTTMapTreasure : BTTMapInteractableObject

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath amount:(NSInteger)amount;

@end
