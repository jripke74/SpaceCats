//
//  SpaceCatNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "SpaceCatNode.h"

@interface SpaceCatNode ()

@property (nonatomic) SKAction *tapAction;

@end

@implementation SpaceCatNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position {
    SpaceCatNode *spaceCat = [self spriteNodeWithImageNamed:@"spaceCat1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.name = @"SpaceCat";
    return spaceCat;
}

- (void) performTap {
    [self runAction:self.tapAction];
}

- (SKAction *) tapAction {
    if (_tapAction != nil) {
        return _tapAction;
    }
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spaceCat2"],
                          [SKTexture textureWithImageNamed:@"spaceCat1"]];
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.25];
    return _tapAction;
}

@end
