//
//  Dice.m
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(instancetype)init {
    self = [super init];
    if (self) {
        [self randomize];
    }
    return self;
}

-(void)randomize {
    self.value = arc4random_uniform(6)+1;
}

-(NSString*)getDieFace {
    NSString* dieFace;
    
    switch (self.value) {
        case 1: {
            dieFace = @"⚀";
            break;
        }
            
        case 2: {
            dieFace = @"⚁";
            break;
        }
            
        case 3: {
            dieFace = @"⚂";
            break;
        }
            
        case 4: {
            dieFace = @"⚃";
            break;
        }
            
        case 5: {
            dieFace = @"⚄";
            break;
        }
            
        case 6: {
            dieFace = @"⚅";
            break;
        }
            
        default:
            break;
    }
    
    return dieFace;
}

@end
