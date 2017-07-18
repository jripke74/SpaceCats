//
//  SpaceDogNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "SpaceDogNode.h"
#import "Utility.h"

@implementation SpaceDogNode

+ (instancetype) spaceDogOfType:(SpaceDogType)type {
    SpaceDogNode *spaceDog;
    if (type == SpaceDogTypeA) {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogA1"];
    } else {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogB1"];
    }
    [spaceDog setupPhysicsBody];
    return spaceDog;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.velocity = CGVectorMake(0, -50);
    self.physicsBody.contactTestBitMask = THCollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = THCollisionCategoryProjectile | THCollisionCategoryGround; // 0010 | 1000 = 1010
    
}
@end
