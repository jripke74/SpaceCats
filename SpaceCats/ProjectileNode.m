//
//  ProjectileNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "ProjectileNode.h"

@implementation ProjectileNode

+ (instancetype) projectileAtPosition:(CGPoint)position {
    ProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile1"];
    projectile.position = position;
    projectile.name = @"Projectile";
    [projectile setupAnimation];
    return projectile;
}

- (void) setupAnimation {
    NSArray *texture = @[[SKTexture textureWithImageNamed:@"projectile1"],
                         [SKTexture textureWithImageNamed:@"projectile2"],
                         [SKTexture textureWithImageNamed:@"projectile3"]];
    SKAction *animation = [SKAction animateWithTextures:texture timePerFrame:0.1];
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
}

@end
