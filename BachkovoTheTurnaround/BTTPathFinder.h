//
//  BTTPathFinder.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTTPathFinder : NSObject

- (NSArray *)shortestPathFrom:(NSIndexPath *)startIndex to:(NSIndexPath *)destinationIndex;

@end
