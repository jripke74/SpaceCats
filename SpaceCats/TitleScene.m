//
//  TitleScrene.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/16/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "TitleScene.h"
#import "GamePlayScene.h"
#import <AVfoundation/AVfoundation.h>

@interface TitleScene ()

@property (nonatomic) SKAction *pressStartSFX;
@property (nonatomic) AVAudioPlayer *backgroundMusic;

@end

@implementation TitleScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"titlePage"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size = self.frame.size;
        [self addChild:background];
        self.pressStartSFX = [SKAction playSoundFileNamed:@"pressStart.caf" waitForCompletion:NO];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"StartScreen" withExtension:@"mp3"];
        self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.backgroundMusic.numberOfLoops = -1;
        [self.backgroundMusic prepareToPlay];
    }
    return self;
}

- (void) didMoveToView:(SKView *)view {
    [self.backgroundMusic play];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self runAction:self.pressStartSFX];
    [self.backgroundMusic stop];
    GamePlayScene *gamePlayScene = [GamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

@end
