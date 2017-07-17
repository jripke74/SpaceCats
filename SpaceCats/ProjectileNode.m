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
    return projectile;
}

@end
