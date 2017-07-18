//
//  GroundNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/18/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "GroundNode.h"
#import "Utility.h"

@implementation GroundNode

+ (instancetype) groundWithSize:(CGSize)size {
    GroundNode *ground = [self spriteNodeWithColor:[SKColor greenColor] size:size];
    ground.name = @"Ground";
    ground.position = CGPointMake(size.width/2, size.height/2);
    [ground setupPhysicsBody];
    return ground;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = THCollisionCategoryGround;
    self.physicsBody.collisionBitMask = THCollisionCategoryDebris;
    self.physicsBody.contactTestBitMask = THCollisionCategoryEnemy;
}
@end
