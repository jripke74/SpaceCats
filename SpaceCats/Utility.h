//
//  Utility.h
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int ProjectileSpeed = 400;

typedef NS_OPTIONS(uint32_t, CollisionCategory) {
    CollisionCategoryEnemy        = 1 << 0,   // 0000
    CollisionCategoryProjectile   = 1 << 1,   // 0010
    CollisionCategoryDebris       = 1 << 2,   // 0100
    CollisionCategoryGround       = 1 << 3    // 1000
};

@interface Utility : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
