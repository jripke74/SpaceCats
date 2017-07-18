//
//  Utility.m
//  SpaceCats
//
//  Created by Jeff Ripke on 7/17/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max {
    return arc4random()%(max - min) + min;
}

@end
