//
//  BTTMapViewController.m
//  BachkovoTheTurnaround
//
//  Created by Radoslav Stankov on 1/25/14.
//  Copyright (c) 2014 Radoslav Stankov. All rights reserved.
//

#import "BTTMapViewController.h"
#import "BTTMapScene.h"

@interface BTTMapViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) BTTMapScene *scene;

@end

@implementation BTTMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = [[SKView alloc] initWithFrame:self.view.frame];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    // SKScene * scene = [BTTMyCity sceneWithSize:skView.bounds.size];
    BTTMapScene * scene = [BTTMapScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    self.scene = scene;
    
    // Present the scene.
    [skView presentScene:scene];


    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:skView.frame];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(30*44, 49*44);
    scrollView.hidden = YES;
    

    [skView addSubview:scrollView];
    [skView addGestureRecognizer:scrollView.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint position = scrollView.contentOffset;
    
    [self.scene setScrollPosition:position];

}

@end
