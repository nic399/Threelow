//
//  InputCollector.m
//  ContactListApp
//
//  Created by Nicholas Fung on 2017-10-03.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector
    
    -(instancetype)init {
        self = [super init];
        if (self) {
            self.history = [[NSMutableArray alloc] initWithObjects:@"0", @"1", @"2", nil];
            self.newest = 2;
            self.numOfHistoryItemsToShow = 3;
        }
        return self;
    }
    
    -(NSString*) inputForPrompt:(NSString *)promptString {
        NSLog(@"%@", promptString);
        
        char inputChar[511];
        fgets(inputChar, 511, stdin);
        self.userInput = [[NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        self.newest = (self.newest+1)%3;
        [self.history insertObject:self.userInput atIndex:self.newest];
        
        return self.userInput;
    }
    
    -(void) printHistory {
        int oldest= (self.newest+1)%3;
        for (int i = 0; i < self.numOfHistoryItemsToShow; i++) {
            NSLog(@"%@", self.history[oldest]);
            oldest = (oldest+1)%3;
        }
    }
    
@end
