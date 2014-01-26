//
//  BTTPlayer.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTTPlayer : NSObject

@property (nonatomic) NSInteger credits;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger attack;
@property (nonatomic) NSInteger defence;
@property (nonatomic) NSInteger mobility;

#define LIGHT_MECH 1
#define RECON_MECH 2

- (NSArray *)army;
@end
