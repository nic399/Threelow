//
//  Dice.h
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "general_defines.h"

@interface Dice : NSObject

@property int value;
@property BOOL isHeld;

-(instancetype)init;
-(void)randomize;
-(NSString*)getDieFace;
-(void)toggleHold;

@end
