//
//  SpaceCatNode.h
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpaceCatNode : SKSpriteNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position;
-(void) performTap;

@end
