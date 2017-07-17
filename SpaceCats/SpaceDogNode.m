//
//  SpaceDogNode.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "SpaceDogNode.h"

@implementation SpaceDogNode

+ (instancetype) spaceDogOfType:(SpaceDogType)type {
    SpaceDogNode *spaceDog;
    if (type == SpaceDogTypeA) {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogA1"];
    } else {
        spaceDog = [self spriteNodeWithImageNamed:@"spaceDogB1"];
    }
    return spaceDog;
}

@end
