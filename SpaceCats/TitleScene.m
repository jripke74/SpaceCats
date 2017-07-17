//
//  TitleScrene.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/16/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "TitleScene.h"
#import "GamePlayScene.h"

@implementation TitleScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"titlePage"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size = self.frame.size;
        [self addChild:background];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    GamePlayScene *gamePlayScene = [GamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

@end
