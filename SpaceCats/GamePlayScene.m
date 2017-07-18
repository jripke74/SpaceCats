//
//  GamePlayScene.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/16/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "GamePlayScene.h"
#import "MachineNode.h"
#import "SpaceCatNode.h"
#import "ProjectileNode.h"
#import "SpaceDogNode.h"
#import "GroundNode.h"
#import "Utility.h"

@interface GamePlayScene ()

@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval timeSinceEnemyAdded;

@end

@implementation GamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.lastUpdateTimeInterval = 0;
        self.timeSinceEnemyAdded = 0;
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundImage"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size = self.frame.size;
        [self addChild:background];
        
        MachineNode *machine = [MachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 12)];
        [self addChild:machine];
        
        SpaceCatNode *spaceCat = [SpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y - 2)];
        [self addChild:spaceCat];
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        self.physicsWorld.contactDelegate = self;
        
        GroundNode *ground = [GroundNode groundWithSize:CGSizeMake(self.frame.size.width, 22)];
        [self addChild:ground];
    }
    return self;
}

- (void) update:(NSTimeInterval)currentTime {
    if (self.lastUpdateTimeInterval) {
        self.timeSinceEnemyAdded += currentTime - self.lastUpdateTimeInterval;
    }
    if (self.timeSinceEnemyAdded > 1.5) {
        [self addSpaceDog];
        self.timeSinceEnemyAdded = 0;
    }
    self.lastUpdateTimeInterval = currentTime;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint position = [touch locationInNode:self];
        [self shootProjectileTowardsPosition:position];
    }
}

- (void) shootProjectileTowardsPosition:(CGPoint)position {
    SpaceCatNode *spaceCat = (SpaceCatNode*)[self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap];
    MachineNode *machine = (MachineNode *)[self childNodeWithName:@"Machine"];
    ProjectileNode *projectile = [ProjectileNode projectileAtPosition:CGPointMake(machine.position.x, machine.position.y+machine.frame.size.height-15)];
    [self addChild:projectile];
    [projectile moveTowardsPosition:position];
    
}

- (void) addSpaceDog {
    NSUInteger randomSpaceDog = [Utility randomWithMin:0 max:2];
    SpaceDogNode *spaceDog = [SpaceDogNode spaceDogOfType:randomSpaceDog];
    float y = self.frame.size.height + spaceDog.size.height;
    float x = [Utility randomWithMin:10+spaceDog.size.width max:self.frame.size.width-spaceDog.size.width-10];
    
    spaceDog.position = CGPointMake(x, y);
    [self addChild:spaceDog];
}

- (void) didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    if (firstBody.categoryBitMask == CollisionCategoryEnemy && secondBody.categoryBitMask == CollisionCategoryProjectile) {
        NSLog(@"BAM!!!");
        SpaceDogNode *spaceDog = (SpaceDogNode *)firstBody.node;
        ProjectileNode *projectile = (ProjectileNode *)secondBody.node;
        [spaceDog removeFromParent];
        [projectile removeFromParent];
    } else if (firstBody.categoryBitMask == CollisionCategoryEnemy && secondBody.categoryBitMask == CollisionCategoryGround) {
        SpaceDogNode *spaceDog = (SpaceDogNode *)firstBody.node;
        [spaceDog removeFromParent];
        NSLog(@"Hit ground!");
    }
    [self createDebrisAtPosition:contact.contactPoint];
}

- (void) createDebrisAtPosition:(CGPoint)position {
    NSInteger numberOfPieces = [Utility randomWithMin:5 max:20];
    for (int i=0; i < numberOfPieces; i++) {
        NSInteger randomPiece = [Utility randomWithMin:1 max:4];
        NSString *imageName = [NSString stringWithFormat:@"debri_%d", randomPiece];
        SKSpriteNode *debris = [SKSpriteNode spriteNodeWithImageNamed:imageName];
        debris.position = position;
        [self addChild:debris];
        debris.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:debris.frame.size];
        debris.physicsBody.categoryBitMask = CollisionCategoryDebris;
        debris.physicsBody.contactTestBitMask = 0;
        debris.physicsBody.collisionBitMask = CollisionCategoryGround | CollisionCategoryDebris;
        debris.name = @"Debris";
        debris.physicsBody.velocity = CGVectorMake([Utility randomWithMin:-150 max:150], [Utility randomWithMin:150 max:350]);
        [debris runAction:[SKAction waitForDuration:2.0] completion:^{
            [debris removeFromParent];
        }];
    }
}
@end
