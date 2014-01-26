//
//  BTTMapCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 26/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapCity.h"

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
    NSLog(@"City interaction with player");
    [super interactWithPlayer:player];
}
@end
