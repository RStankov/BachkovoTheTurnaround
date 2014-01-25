//
//  BTTBattleViewController.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTBattleViewController.h"
#import "BTTBattleScene.h"

@interface BTTBattleViewController ()

@end

@implementation BTTBattleViewController

- (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    // SKScene * scene = [BTTMyCity sceneWithSize:skView.bounds.size];
    SKScene * scene = [BTTBattleScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
