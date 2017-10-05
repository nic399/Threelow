//
//  GameController.m
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "GameController.h"

@implementation GameController

-(instancetype)init {
    self = [super init];
    if (self) {
        Dice* d1 = [[Dice alloc] init];
        Dice* d2 = [[Dice alloc] init];
        Dice* d3 = [[Dice alloc] init];
        Dice* d4 = [[Dice alloc] init];
        Dice* d5 = [[Dice alloc] init];
        self.score = 0;
        self.rollsRemaining = 5;
        self.diceDict = [[NSMutableDictionary alloc] initWithDictionary:@{@"1":d1, @"2":d2, @"3":d3, @"4":d4, @"5":d5}];
    }
    return self;
}

-(void)print {
    self.score = 0;
    [self printDice];
    for (int i = 1; i < 6; i++) {
        Dice *thisDie = [self.diceDict objectForKey:[NSString stringWithFormat:@"%i", i]];
        if (thisDie.isHeld) {
            if (thisDie.value == 3) {
            }
            else {
                self.score += thisDie.value;
            }
        }
    }
    NSLog(@"Current score of held dice: %i\nRolls remaining: %i", self.score, self.rollsRemaining);
}

-(void)printDice {
    for (int i = 1; i < 6; i++) {
        Dice *thisDie = [self.diceDict objectForKey:[NSString stringWithFormat:@"%i", i]];
        if (thisDie.isHeld) {
            NSLog(@"Die %i: [%@]", i, thisDie.getDieFace);
        }
        else {
            NSLog(@"Die %i:  %@ ", i, thisDie.getDieFace);
        }
    }
}

-(void)rollDice {
    for (Dice* thisOne in self.diceDict) {
        Dice *thisDie = [self.diceDict objectForKey:thisOne];
        [thisDie randomize];
    }
    self.rollsRemaining--;
    
    if (self.rollsRemaining == 0) {
        NSLog(@"Out of rolls!");
        [self endRound];
    }
}

-(void)holdDie:(int)index {
    Dice *selectedDie = [self.diceDict objectForKey:[NSString stringWithFormat:@"%i",index]];
    if (!selectedDie.isHeld) {
        [selectedDie toggleHold];
    }
}

-(void)releaseDie:(int)index {
    Dice *selectedDie = [self.diceDict objectForKey:[NSString stringWithFormat:@"%i",index]];
    if (selectedDie.isHeld) {
        [selectedDie toggleHold];
    }
}

-(void)endRound {
    [self printDice];
    self.score = 0;
    self.rollsRemaining = 5;
    for (int i = 0; i < 6; i++) {
        Dice *thisDie = [self.diceDict objectForKey:[NSString stringWithFormat:@"%i", i]];
        if (thisDie.value == 3) {
        }
        else {
            self.score += thisDie.value;
        }        [self releaseDie:i];
    }
    [self rollDice];
    NSLog(@"Game finished! Your final score: %i", self.score);

}

@end
