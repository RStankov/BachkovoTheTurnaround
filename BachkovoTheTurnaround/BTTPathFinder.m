//
//  BTTPathFinder.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTTPathFinder.h"

@interface BTTPathFinderStep : NSObject

@property (nonatomic) NSInteger gScore;
@property (nonatomic) NSInteger hScore;
@property (nonatomic, strong) BTTPathFinderStep *parent;
@property (nonatomic, strong) NSIndexPath *indexPath;

- (NSInteger)fScore;

@end

@implementation BTTPathFinderStep

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = [self init];
    
    if (self) {
        _gScore = 0;
        _hScore = 0;
        
        self.parent = nil;
        self.indexPath = indexPath;
    }
    
    return self;
}

- (BOOL)isEqual:(BTTPathFinderStep *)other {
    return [self.indexPath isEqual:other.indexPath];
}

- (NSInteger)fScore {
    return _gScore + _hScore;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@  pos=[%@]  g=%ld  h=%ld  f=%ld", [super description], self.indexPath, (long)self.gScore, (long)self.hScore, (long)[self fScore]];
}

@end

@interface BTTPathFinder ()

@property (nonatomic, strong) id<BTTPathFinderDataSource> dataSource;

@end

@implementation BTTPathFinder

- (instancetype)initWithDataSource:(id<BTTPathFinderDataSource>)dataSource {
    self = [self init];

    if (self) {
        self.dataSource = dataSource;
    }

    return self;
}

- (NSArray *)shortestPathFrom:(NSIndexPath *)startIndex to:(NSIndexPath *)destinationIndex {
    if ([startIndex isEqual:destinationIndex]) {
        return @[];
    }

    NSMutableArray *openSteps   = [NSMutableArray array];
    NSMutableArray *closedSteps = [NSMutableArray array];

    // Start by adding the from position to the open list
    [self insertInOpenSteps:openSteps step:[[BTTPathFinderStep alloc] initWithIndexPath:startIndex]];

    do {
        // Because the list is ordered, the first step is always the one with the lowest F cost
        BTTPathFinderStep *currentStep = openSteps[0];

        // Add the current step to the closed set
        [closedSteps addObject:currentStep];

        // Remove it from the open list
        [openSteps removeObjectAtIndex:0];

        // If the currentStep is at the desired position, we have done
        if ([currentStep.indexPath isEqual:destinationIndex]) {
            NSMutableArray *shortestPath = [NSMutableArray array];

            for (BTTPathFinderStep *step = currentStep; step != nil; step = step.parent) {
                [shortestPath insertObject:step.indexPath atIndex:0];
            }

            return shortestPath;
        }

        // Get the adjacent position of the current step
        for (NSIndexPath *v in [self.dataSource availablePositionsAround:currentStep.indexPath]) {
            BTTPathFinderStep *step = [[BTTPathFinderStep alloc] initWithIndexPath:v];
            
            // Check if the step isn't already in the closed set
            if ([closedSteps containsObject:step]) {
                continue; // Ignore it
            }
            
            // Check if the step is already in the open list
            NSUInteger index = [openSteps indexOfObject:step];
            
            if (index == NSNotFound) {
                // Not on the open list, so add it
                // Set the current step as the parent
                step.parent = currentStep;
                
                // Compute the H score which is the estimated movement cost to move from that step to the desired position
                step.hScore = abs(step.indexPath.item - destinationIndex.item) + abs(step.indexPath.section - destinationIndex.section);
                
                // The G score is equal to the parent G score + the cost to move from the parent to it
                step.gScore = currentStep.gScore;

                // Adding it with the function which is preserving the list ordered by F score
                [self insertInOpenSteps:openSteps step:step];
            } else {
                step = openSteps[index]; // To retrieve the old one (which has its scores already computed ;-)

                // Check to see if the G score for that step is lower if we use the current step to get there
                if (currentStep.gScore < step.gScore) {
                    // Now we can removing it from the list without be afraid that it can be released
                    [openSteps removeObjectAtIndex:index];

                    // The G score is equal to the parent G score + the cost to move from the parent to it
                    step.gScore = currentStep.gScore;

                    // Re-insert it with the function which is preserving the list ordered by F score
                    [self insertInOpenSteps:openSteps step:step];
                }
            }
        }
    } while (openSteps.count > 0);
    
    return @[];
}

// Insert a path step (ShortestPathStep) in the ordered open steps list (spOpenSteps)
- (void)insertInOpenSteps:(NSMutableArray *)steps step:(BTTPathFinderStep *)step {
    NSInteger i = 0;

    for (NSInteger count = steps.count; i < count; i++) {
        if (step.fScore <= ((BTTPathFinderStep *)steps[i]).fScore) {
            break;
        }
    }

    [steps insertObject:step atIndex:i];
}

@end