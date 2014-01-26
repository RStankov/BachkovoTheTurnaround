//
//  BTTMapBattle.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/26/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTTMapInteractableObject.h"

@interface BTTMapEnemy : BTTMapInteractableObject

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath enemies:(NSArray *)enemies;

@end
