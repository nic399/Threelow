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

        self.heldDice = [NSMutableArray new];
        self.freeDice = [NSMutableArray arrayWithObjects:d1, d2, d3, d4, d5, nil];
        [self print];
    }
    return self;
}

-(void)print {
    int i = 1;
    for (Dice *thisOne in self.heldDice) {
        NSLog(@"Die %i: [%@]", i, thisOne.getDieFace);
        i++;
    }
    for (Dice *thisOne in self.freeDice) {
        NSLog(@"Die %i:  %@ ", i, thisOne.getDieFace);
        i++;
    }
}

-(void)rollDice {
    for (Dice* thisOne in self.freeDice) {
        [thisOne randomize];
    }
    [self print];
}

@end
