//
//  GameController.h
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property NSMutableArray *heldDice;
@property NSMutableArray *freeDice;

-(void)print;
//-(void)holdDie;
-(void)rollDice;

@end
