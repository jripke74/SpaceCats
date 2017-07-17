//
//  GamePlayScene.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/16/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "GamePlayScene.h"

@implementation GamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundImage"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size = self.frame.size;
        [self addChild:background];
        SKSpriteNode *machine = [SKSpriteNode spriteNodeWithImageNamed:@"machine1"];
        machine.position = CGPointMake(CGRectGetMidX(self.frame), 12);
        machine.anchorPoint = CGPointMake(0.5, 0);
        [self addChild:machine];
        
    }
    return self;
}

@end
