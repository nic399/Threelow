//
//  main.m
//  Threelow
//
//  Created by Nicholas Fung on 2017-10-04.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *menuPrompt = @"What would you like to do?\nroll - roll all unheld dice\nhold # - hold die #\nunhold # - unhold die #\nreset - unhold all dice\nnewgame - end current game and start a new game";
        NSDictionary* commands = @{@"roll":@"1",
                                   @"hold":@"2",
                                   @"unhold":@"3",
                                   @"reset":@"4",
                                   @"newgame":@"5"
                                   };
        
        InputCollector* myInputCollector = [[InputCollector alloc] init];
        NSString *userInput;
        int userCommand;
        NSCharacterSet *nonalphanumericSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        
        BOOL gameOn = true;
        GameController *myGameController = [[GameController alloc] init];
        
        while (gameOn) {
            userInput = [myInputCollector inputForPrompt:menuPrompt];
            NSArray *arrayWithInputWords = [userInput componentsSeparatedByCharactersInSet:nonalphanumericSet];
            userCommand = [[commands valueForKey:[arrayWithInputWords firstObject]] intValue];
            NSLog(@"Input: %@\nCommand #: %i - %@", userInput, userCommand, [arrayWithInputWords firstObject]);
            
            
            
            
            
            
            
            switch (userCommand) {
                    
                case 1: { //roll dice
                    [myGameController rollDice];
                    break;
                }
                    
                case 2: { // hold dice
                    if ([arrayWithInputWords count] < 2) {
                        NSLog(@"Error: No die selected to hold");
                        break;
                    }
                    userInput = arrayWithInputWords[1];
                    NSLog(@"attempting to hold die #%@ array count is %lu",userInput, (unsigned long)[arrayWithInputWords count]);
                    [myGameController holdDie:[userInput intValue]];
                    break;
                }
                    
                case 3: { // unhold dice
                    if ([arrayWithInputWords count] < 2) {
                        NSLog(@"Error: No die selected to unhold");
                        break;
                    }
                    userInput = arrayWithInputWords[1];
                    NSLog(@"attempting to unhold die #%@ array count is %lu",userInput, (unsigned long)[arrayWithInputWords count]);
                    [myGameController releaseDie:[userInput intValue]];
                    break;
                }
                    /*
                     case 4: { // reset all held dice
                     
                     break;
                     }
                     
                     case 5: { // start a new game
                     <#statements#>
                     break;
                     }
                     */
                    //                case <#constant#>: {
                    //                    <#statements#>
                    //                    break;
                    //                }
                    
                default:
                    break;
            }
            
            
            
            
            
            
           
            [myGameController print];
            
        }
        
        
    }
    return 0;
}



























