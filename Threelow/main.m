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
                                   @"newgame":@"5",
                                   @"imacheater":@"6"
                                   };
        
        InputCollector* myInputCollector = [[InputCollector alloc] init];
        NSString *userInput;
        int userCommand;
        NSCharacterSet *nonalphanumericSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        
        BOOL gameOn = true;
        GameController *myGameController = [[GameController alloc] init];
        
        NSLog(@"Welcome to Threelow! The Rules are simple:");
        NSLog(@"You have 5 dice.");
        NSLog(@"Your score is determined by the sum of their face values, except for 3s which are worth zero.");
        NSLog(@"You are only allowed to roll a maximum of 5 times per game/round.");
        NSLog(@"You may choose to hold certain dice: those dice will not be rolled.");
        NSLog(@"Aim to get the lowest score possible!");
        while (gameOn) {
            [myGameController print];
            userInput = [myInputCollector inputForPrompt:menuPrompt];
            NSArray *arrayWithInputWords = [userInput componentsSeparatedByCharactersInSet:nonalphanumericSet];
            userCommand = [[commands valueForKey:[arrayWithInputWords firstObject]] intValue];
            
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
                    [myGameController holdDie:[userInput intValue]];
                    break;
                }
                    
                case 3: { // unhold dice
                    if ([arrayWithInputWords count] < 2) {
                        NSLog(@"Error: No die selected to unhold");
                        break;
                    }
                    userInput = arrayWithInputWords[1];
                    [myGameController releaseDie:[userInput intValue]];
                    break;
                }
                    
                case 4: { // reset all held dice
                    for (int i = 1; i < 6; i++) {
                        [myGameController releaseDie:i];
                    }
                    break;
                }
                    
                case 5: { // start a new game
                    [myGameController endRound];
                    break;
                }
                    
                case 6: { // cheating is bad
                    [myGameController cheat];
                    break;
                }
                    
                default:
                    break;
            }
        }
    }
    return 0;
}



























