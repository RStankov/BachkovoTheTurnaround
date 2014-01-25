//
//  BTTViewController.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/24/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTCityViewController.h"
#import "BTTCity.h"
#import "BTTMainBuilding.h"
#import "BTTMechGarrisonBuilding.h"

@implementation BTTCityViewController

- (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    BTTCity * city = [BTTCity sceneWithSize:skView.bounds.size];
    city.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:city];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
