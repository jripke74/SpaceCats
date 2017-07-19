//
//  GameOverNode.h
//  SpaceCats
//
//  Created by Jeff Ripke on 7/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameOverNode : SKNode

+ (instancetype) gameOverAtPosition:(CGPoint)position;
- (void) performAnimation;

@end
