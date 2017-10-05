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

@property NSMutableDictionary *diceDict;
@property int score;
@property int rollsRemaining;

-(void)print;
-(void)holdDie:(int)index;
-(void)rollDice;
-(void)releaseDie:(int)index;


@end
