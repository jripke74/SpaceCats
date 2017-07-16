//
//  GameScene.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/15/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {

}

- (void)didMoveToView:(SKView *)view {
    
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    
    SKSpriteNode *greenNode = [SKSpriteNode spriteNodeWithColor: [SKColor greenColor] size:CGSizeMake(10, 200)];
    greenNode.position = CGPointMake(0, 0);
    greenNode.anchorPoint = CGPointMake(0, 0);
    [self addChild:greenNode];
    
    SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(200, 10)];
    redNode.position = CGPointMake(0, 0);
    redNode.anchorPoint = CGPointMake(0, 0);
    [self addChild:redNode];
}

@end
