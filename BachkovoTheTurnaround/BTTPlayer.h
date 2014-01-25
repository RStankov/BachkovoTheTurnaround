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

#define LIGHT_MECH 1
#define RECON_MECH 2

- (instancetype)initWithName: (NSString *) name credits: (NSInteger)credits;

- (NSArray *)army;
@end
