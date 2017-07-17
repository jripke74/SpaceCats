//
//  GameViewController.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/15/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "GameViewController.h"
#import "TitleScene.h"

@implementation GameViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Configure view
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene *scene = [TitleScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
}
@end
