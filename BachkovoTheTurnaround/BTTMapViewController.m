//
//  BTTMapViewController.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

@import AVFoundation;

#import "BTTMapViewController.h"
#import "BTTMapScene.h"
#import "BTTMap.h"

@interface BTTMapViewController ()

@property (nonatomic) AVAudioPlayer * backgroundMusicPlayer;
@property (nonatomic, strong) BTTMapScene *scene;

@end

@implementation BTTMapViewController

- (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView *skView = (SKView *)self.view;

    BTTMap *map = [[BTTMap alloc] init];
    
    // Create and configure the scene.
    BTTMapScene *scene = [[BTTMapScene alloc] initWithMap:map size:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    self.scene = scene;
    
    // Present the scene.
    [skView presentScene:scene];
    
    [self startBackgroundMusic];
    
}

- (void) startBackgroundMusic {
    NSError *error;
    NSURL *backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"space_organics" withExtension:@"aif"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
}

@end
