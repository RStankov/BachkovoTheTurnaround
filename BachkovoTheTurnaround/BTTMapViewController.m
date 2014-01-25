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

@interface BTTMapViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) BTTMapScene *scene;

@end

@implementation BTTMapViewController

- (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    // Create and configure the scene.

    BTTMap *map = [[BTTMap alloc] init];
    map.tileSize = 45;
    map.horizontalTileCount = 30;
    map.verticalTilesCount = 40;

    BTTMapScene * scene = [[BTTMapScene alloc] initWithMap:map size:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;

    self.scene = scene;

    // Present the scene.
    [skView presentScene:scene];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:skView.frame];
    scrollView.delegate = self;
    scrollView.contentSize = map.size;
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
