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
        
        [d1 printDieFace];
        [d2 printDieFace];
        [d3 printDieFace];
        [d4 printDieFace];
        [d5 printDieFace];
        self.heldDice = [NSMutableArray new];
        self.freeDice = [NSMutableArray arrayWithObjects:d1, d2, d3, d4, d5, nil];
    }
    return self;
}

@end
