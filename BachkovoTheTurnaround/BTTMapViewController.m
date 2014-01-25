//
//  BTTMapViewController.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapViewController.h"
#import "BTTMapScene.h"
#import "BTTMap.h"

@interface BTTMapViewController ()

@property (nonatomic, strong) BTTMapScene *scene;

@end

@implementation BTTMapViewController

- (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    BTTMap *map = [[BTTMap alloc] init];
    map.tileSize = 45;
    map.horizontalTileCount = 30;
    map.verticalTilesCount = 40;
    
    // Create and configure the scene.
    BTTMapScene *scene = [[BTTMapScene alloc] initWithMap:map size:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    self.scene = scene;
    
    // Present the scene.
    [skView presentScene:scene];
}

@end
