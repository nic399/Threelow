//
//  InputCollector.h
//  ContactListApp
//
//  Created by Nicholas Fung on 2017-10-03.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "general_defines.h"
@interface InputCollector : NSObject
    
    @property NSString* userInput;
    @property NSMutableArray* history;
    @property int newest;
    @property int numOfHistoryItemsToShow;
    
    -(NSString*) inputForPrompt: (NSString *) promptString;
    -(void) printHistory;

@end
