//
//  BTTPathFinder.h
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTTPathFinder.h"

// A class that represents a step of the computed path
@interface ShortestPathStep : NSObject

@property (nonatomic) NSInteger gScore;
@property (nonatomic) NSInteger hScore;
@property (nonatomic, strong) ShortestPathStep *parent;

- (int)fScore;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ShortestPathStep

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

- (BOOL)isEqual:(ShortestPathStep *)other {
    return [self.indexPath isEqual:other.indexPath];
}

- (int)fScore {
    return self.gScore + self.hScore;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@  pos=[%@]  g=%d  h=%d  f=%d", [super description], self.indexPath, self.gScore, self.hScore, [self fScore]];
}

@end

@interface BTTPathFinder ()

@property (nonatomic, retain) NSMutableArray *spOpenSteps;
@property (nonatomic, retain) NSMutableArray *spClosedSteps;

@end

@implementation BTTPathFinder

- (NSArray *)moveTowardFrom:(NSIndexPath *)fromTileCoor to:(NSIndexPath *)toTileCoord {
    if ([fromTileCoor isEqual:toTileCoord]) {
        return @[];
    }

    self.spOpenSteps   = [NSMutableArray array];
    self.spClosedSteps = [NSMutableArray array];
    
    
    // Start by adding the from position to the open list
    [self insertInOpenSteps:[[ShortestPathStep alloc] initWithIndexPath:fromTileCoor]];
    
    do {
        // Get the lowest F cost step
        // Because the list is ordered, the first step is always the one with the lowest F cost
        ShortestPathStep *currentStep = [self.spOpenSteps objectAtIndex:0];
        
        // Add the current step to the closed set
        [self.spClosedSteps addObject:currentStep];
        
        // Remove it from the open list
        // Note that if we wanted to first removing from the open list, care should be taken to the memory
        [self.spOpenSteps removeObjectAtIndex:0];
        
        // If the currentStep is at the desired tile coordinate, we have done
        if ([currentStep.indexPath isEqual:toTileCoord]) {
            ShortestPathStep *step = currentStep;
            NSMutableArray *shortestPath = [NSMutableArray array];
            do {
                if (step.parent != nil) { // Don't add the last step which is the start position (remember we go backward, so the last one is the origin position ;-)
//                    [shortestPath insertObject:step atIndex:0]; // Always insert at index 0 to reverse the path
                    [shortestPath insertObject:step.indexPath atIndex:0];
                }
                step = step.parent; // Go backward
            } while (step != nil); // Until there is not more parent
            
            self.spOpenSteps = nil; // Set to nil to release unused memory
            self.spClosedSteps = nil; // Set to nil to release unused memory
            
            return shortestPath;
        }
        
        // Get the adjacent tiles coord of the current step
        NSArray *adjSteps = [self walkableAdjacentTilesCoordForTileCoord:currentStep.indexPath];
        for (NSIndexPath *v in adjSteps) {
            ShortestPathStep *step = [[ShortestPathStep alloc] initWithIndexPath:v];
            
            // Check if the step isn't already in the closed set
            if ([self.spClosedSteps containsObject:step]) {
                continue; // Ignore it
            }
            
            // Check if the step is already in the open list
            NSUInteger index = [self.spOpenSteps indexOfObject:step];
            
            if (index == NSNotFound) {
                // Not on the open list, so add it
                // Set the current step as the parent
                step.parent = currentStep;
                
                // The G score is equal to the parent G score + the cost to move from the parent to it
                step.gScore = currentStep.gScore;
                
                // Compute the H score which is the estimated movement cost to move from that step to the desired tile coordinate
                step.hScore = abs(step.indexPath.item - toTileCoord.item) + abs(step.indexPath.section - toTileCoord.section);
                
                // Adding it with the function which is preserving the list ordered by F score
                [self insertInOpenSteps:step];
            } else {
                step = [self.spOpenSteps objectAtIndex:index]; // To retrieve the old one (which has its scores already computed ;-)
                
                // Check to see if the G score for that step is lower if we use the current step to get there
                if ((currentStep.gScore) < step.gScore) {
                    // The G score is equal to the parent G score + the cost to move from the parent to it
                    step.gScore = currentStep.gScore;
                    
                    // Because the G Score has changed, the F score may have changed too
                    // So to keep the open list ordered we have to remove the step, and re-insert it with
                    // the insert function which is preserving the list ordered by F score
                    
                    // Now we can removing it from the list without be afraid that it can be released
                    [self.spOpenSteps removeObjectAtIndex:index];
                    
                    // Re-insert it with the function which is preserving the list ordered by F score
                    [self insertInOpenSteps:step];
                }
            }
        }
    } while (self.spOpenSteps.count > 0);
    
    return @[];
}

// Insert a path step (ShortestPathStep) in the ordered open steps list (spOpenSteps)
- (void)insertInOpenSteps:(ShortestPathStep *)step {
    NSInteger i = 0;
    for (int count = self.spOpenSteps.count; i < count; i++) {
        if (step.fScore <= ((ShortestPathStep *)self.spOpenSteps[i]).fScore) {
            break;
        }
    }
    [self.spOpenSteps insertObject:step atIndex:i];
}

- (NSArray *)walkableAdjacentTilesCoordForTileCoord:(NSIndexPath *)tileCoord {
	NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:4];
	
	// Top
	NSIndexPath *p = [NSIndexPath indexPathForItem:tileCoord.item inSection:tileCoord.section - 1];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}
	
	// Left
	p = [NSIndexPath indexPathForItem:tileCoord.item - 1 inSection:tileCoord.section];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}
	
	// Bottom
	p = [NSIndexPath indexPathForItem:tileCoord.item inSection:tileCoord.section + 1];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}
	
	// Right
	p = [NSIndexPath indexPathForItem:tileCoord.item + 1 inSection:tileCoord.section];
	if ([self isValidTileCoord:p] && ![self isWallAtTileCoord:p]) {
		[tmp addObject:p];
	}
    
	return [NSArray arrayWithArray:tmp];
}

- (BOOL)isValidTileCoord:(NSIndexPath *)tileCoord {
    int width = 100;
    int height = 100;
    return tileCoord.item > 0 || tileCoord.section > 0 || tileCoord.item <= width || tileCoord.section <= height;
}

-(BOOL)isWallAtTileCoord:(NSIndexPath *)path {
    return NO;
}

@end