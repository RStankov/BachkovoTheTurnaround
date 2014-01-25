//
//  BTTPathFinder.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BTTPathFinderDataSource;

@interface BTTPathFinder : NSObject

- (NSArray *)shortestPathFrom:(NSIndexPath *)startIndex to:(NSIndexPath *)destinationIndex;

- (instancetype)initWithDataSource:(id<BTTPathFinderDataSource>)dataSource;

@end

@protocol BTTPathFinderDataSource <NSObject>

- (NSArray *)availablePositionsAround:(NSIndexPath *)indexPath;
    
@end
