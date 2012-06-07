//
//  ANAppDelegate.m
//  ControlBar
//
//  Created by Alex Nichol on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ANAppDelegate.h"

@implementation ANAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    items = [[NSMutableArray alloc] init];
    
    addButton = [[ANAddRemoveButton alloc] init];
    addButton.target = self;
    addButton.action = @selector(addPressed:);
    
    removeButton = [[ANAddRemoveButton alloc] init];
    removeButton.addButton = NO;
    removeButton.enabled = NO;
    removeButton.target = self;
    removeButton.action = @selector(removePressed:);
    
    [controlBar addButton:addButton];
    [controlBar addButton:removeButton];
}

- (void)addPressed:(id)sender {
    [items addObject:@""];
    [tableView reloadData];
    [tableView editColumn:0 row:([items count] - 1) withEvent:nil select:YES];
}

- (void)removePressed:(id)sender {
    NSIndexSet * indices = [tableView selectedRowIndexes];
    [indices enumerateIndexesWithOptions:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * stop) {
        [items removeObjectAtIndex:idx];
    }];
    [tableView reloadData];
}

#pragma mark - Table View -

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    if ([[tableView selectedRowIndexes] count] == 0) {
        removeButton.enabled = NO;
        [controlBar setNeedsDisplay:YES];
    } else {
        removeButton.enabled = YES;
        [controlBar setNeedsDisplay:YES];
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [items count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return [items objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    [items replaceObjectAtIndex:row withObject:object];
}

@end
