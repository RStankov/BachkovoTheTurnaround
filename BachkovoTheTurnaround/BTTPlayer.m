//
//  BTTPlayer.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTPlayer.h"

@implementation BTTPlayer

- (NSArray *)army {
    return @[@LIGHT_MECH, @RECON_MECH];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{Player - attack:%ld defence:%ld mobility:%ld credits:%ld}", self.attack, self.defence, self.mobility, self.credits];
}

@end
