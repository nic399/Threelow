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

        self.diceDict = [[NSMutableDictionary alloc] initWithDictionary:@{@"1":d1, @"2":d2, @"3":d3, @"4":d4, @"5":d5}];
        [self print];
    }
    return self;
}

-(void)print {
    int i = 1;
    for (id thisOne in self.diceDict) {
        Dice *thisDie = [self.diceDict objectForKey:thisOne];
        NSLog(@"Die %i:  %@ ", i, thisDie.getDieFace);
        i++;
    }
}

-(void)rollDice {
    for (Dice* thisOne in self.diceDict) {
        Dice *thisDie = [self.diceDict objectForKey:thisOne];
        [thisDie randomize];
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

@end
