//
//  ANAppDelegate.h
//  ControlBar
//
//  Created by Alex Nichol on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ANControlBar.h"
#import "ANAddRemoveButton.h"

@interface ANAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource> {
    IBOutlet NSTableView * tableView;
    IBOutlet ANControlBar * controlBar;
    __unsafe_unretained IBOutlet NSWindow * window;
    
    NSMutableArray * items;
    ANAddRemoveButton * removeButton;
    ANAddRemoveButton * addButton;
}

@property (nonatomic, assign) IBOutlet NSWindow * window;

- (void)addPressed:(id)sender;
- (void)removePressed:(id)sender;

@end
