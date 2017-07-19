//
//  HudNode.h
//  SpaceCats
//
//  Created by Jeff Ripke on 7/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HudNode : SKNode

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;
+ (instancetype) hudAtPosition:(CGPoint)position inFrame:(CGRect)frame;

@end
