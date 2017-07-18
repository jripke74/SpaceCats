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

@implementation GamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"backgroundImage"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size = self.frame.size;
        [self addChild:background];
        
        MachineNode *machine = [MachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 12)];
        [self addChild:machine];
        
        SpaceCatNode *spaceCat = [SpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y - 2)];
        [self addChild:spaceCat];
        
        [self addSpaceDog];
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        GroundNode *ground = [GroundNode groundWithSize:CGSizeMake(self.frame.size.width, 22)];
        [self addChild:ground];
    }
    return self;
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
    SpaceDogNode *spaceDogA = [SpaceDogNode spaceDogOfType:SpaceDogTypeA];
    spaceDogA.position = CGPointMake(100, 300);
    [self addChild:spaceDogA];
    
    SpaceDogNode *spaceDogB = [SpaceDogNode spaceDogOfType:SpaceDogTypeB];
    spaceDogB.position = CGPointMake(200, 300);
    [self addChild:spaceDogB];
    
}
@end
