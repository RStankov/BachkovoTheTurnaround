//
//  BTTBattleship.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTTPlayer.h"

@interface BTTBattleship : NSObject

@property (nonatomic) NSInteger attack;
@property (nonatomic) NSInteger defence;
@property (nonatomic, strong) NSString *name;

- (instancetype) initWithPlayer:(BTTPlayer *)player name:(NSString *)name;

@end
