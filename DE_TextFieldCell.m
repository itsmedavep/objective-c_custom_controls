//
//  DE_TextFieldCell.m
//  custom_controls
//
//  Created by David Palmer on 6/22/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_TextFieldCell.h"



@implementation DE_TextFieldCell



- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    NSRect newCellFrame = cellFrame;
    
    NSBezierPath *myCellBackground = [NSBezierPath bezierPathWithRect:newCellFrame];
    
    if (self.highlighted) {
        
        self.highlighted = NO;
    }
    else {
        [[NSColor darkGrayColor] set];
        [myCellBackground fill];
        
        [[NSColor blackColor] set];
        [myCellBackground stroke];
    };
    }
    
    
    
//    [super drawWithFrame:newCellFrame inView:controlView];
    


@end
