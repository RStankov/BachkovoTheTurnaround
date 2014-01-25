//
//  BTTMyCity.m
//  BachkovoTheTurnaround
//
//  Created by Stefan Slaveykov on 25/01/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMyCity.h"

@implementation BTTMyCity

-(id)initWithSize:(CGSize)size {
    if(self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.10 green:0.5 blue:0.10 alpha:0.5];
        //Should render building
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Main building is here";
        myLabel.fontSize = 10;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }
    return self;
}

-(NSMutableArray *) buildingsCompleted {
    return self.buildingsCompleted;
}

-(void) buildBuilding {

}


@end
