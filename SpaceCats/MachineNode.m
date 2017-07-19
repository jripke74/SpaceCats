//
//  MachineNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "MachineNode.h"

@implementation MachineNode

+ (instancetype) machineAtPosition:(CGPoint)position {
    MachineNode *machine = [self spriteNodeWithImageNamed:@"machine1"];
    machine.position = position;
    machine.name = @"Machine";
    machine.anchorPoint = CGPointMake(0.5, 0);
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine1"], [SKTexture textureWithImageNamed:@"machine2"]];
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    [machine runAction:machineRepeat];
    machine.zPosition = 8;
    return machine;
}
@end
