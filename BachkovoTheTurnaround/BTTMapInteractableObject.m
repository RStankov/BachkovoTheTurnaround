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

@end

@implementation BTTMapInteractableObject

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = [self init];
    
    if (self) {
        self.position = indexPath;
    }

    return self;
}

- (NSIndexPath *)indexPath {
    return self.position;
}

@end
