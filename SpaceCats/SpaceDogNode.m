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
    NSArray *textures;
    if (type == SpaceDogTypeA) {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogA1"];
        textures = @[[SKTexture textureWithImageNamed:@"spaceDogA1"],
                     [SKTexture textureWithImageNamed:@"spaceDogA1"],
                     [SKTexture textureWithImageNamed:@"spaceDogA1"]];
        spaceDog.type = SpaceDogTypeA;
    } else {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogB1"];
        textures = @[[SKTexture textureWithImageNamed:@"spaceDogB1"],
                     [SKTexture textureWithImageNamed:@"spaceDogB1"],
                     [SKTexture textureWithImageNamed:@"spaceDogB1"],
                     [SKTexture textureWithImageNamed:@"spaceDogB1"]];
        spaceDog.type = SpaceDogTypeB;
    }
    float scale = [Utility randomWithMin:85 max:100] / 100.0f;
    spaceDog.xScale = scale;
    spaceDog.yScale = scale;
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    [spaceDog runAction:[SKAction repeatActionForever:animation] withKey:@"animation"];
    [spaceDog setupPhysicsBody];
    return spaceDog;
}

- (BOOL) isDamaged {
    NSArray *textures;
    if (!_damaged) {
        [self removeActionForKey:@"animation"];
        if (self.type == SpaceDogTypeA) {
            textures = @[[SKTexture textureWithImageNamed:@"spaceDogA3"]];
        } else {
            textures = @[[SKTexture textureWithImageNamed:@"spaceDogB3"]];
        }
        SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
        [self runAction:[SKAction repeatActionForever:animation] withKey:@"damageAnimation"];
        _damaged = YES;
        return NO;
    } else {
        return _damaged;
    }
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    
    self.physicsBody.categoryBitMask = CollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryProjectile | CollisionCategoryGround; // 0010 | 1000 = 1010
    
}
@end
