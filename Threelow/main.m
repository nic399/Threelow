//
//  main.m
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "general_defines.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
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
        
        InputCollector* myInputCollector = [[InputCollector alloc] init];
        BOOL gameOn = true;
        NSString *menuPrompt = @"What would you like to do?\nroll - roll all unheld dice\nhold # - hold die #\nunhold # - unhold die #\nreset - unhold all dice\nnewgame - end current game and start a new game";
        NSDictionary* commands = @{@"roll":@"1",
                                   @"hold":@"2",
                                   @"unhold":@"3",
                                   @"reset":@"4",
                                   @"newgame":@"5"
                                   };
        NSMutableArray *diceArr = [[NSMutableArray alloc] initWithObjects:d1, d2, d3, d4, d5, nil];
        NSString *userInput;
        int userCommand;
        NSCharacterSet *nonalphanumericSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];

        
        while (gameOn) {
            userInput = [myInputCollector inputForPrompt:menuPrompt];
            NSArray *arrayWithInputWords = [userInput componentsSeparatedByCharactersInSet:nonalphanumericSet];
            userCommand = [[commands valueForKey:[arrayWithInputWords firstObject]] intValue];
            NSLog(@"Input: %@\nCommand #: %i - %@", userInput, userCommand, [arrayWithInputWords firstObject]);

            
            
            
            
            
            
            switch (userCommand) {

                case 1: { //roll dice
                    <#statements#>
                    break;
                }
                
                case 2: { // hold dice
                    <#statements#>
                    break;
                }
                    
                case 3: { // unhold dice
                    <#statements#>
                    break;
                }
                    
                case 4: { // reset all held dice
                    <#statements#>
                    break;
                }
                    
                case 5: { // start a new game
                    <#statements#>
                    break;
                }
                    
//                case <#constant#>: {
//                    <#statements#>
//                    break;
//                }
                    
                default:
                    break;
            }
            
            
            
            
            
            

            
        }
        
        
    }
    return 0;
}



























