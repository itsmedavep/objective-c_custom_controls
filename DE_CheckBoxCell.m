//
//  DE_CheckBoxCell.m
//  custom_controls
//
//  Created by David Palmer on 8/13/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_CheckBoxCell.h"

@implementation DE_CheckBoxCell

- (void)drawImage:(NSImage *)image
        withFrame:(NSRect)frame
           inView:(NSView *)controlView {
    
    
    // Drawing border
    if(![self isEnabled]) {
        [[NSColor lightGrayColor] setFill];
    } else {
        [[NSColor grayColor] setFill];
    }
    NSRectFill(NSInsetRect(frame, 2, 2));
    NSRect fillFrame = NSInsetRect(frame, 4, 4);
    
    // Drawing inner contents
    if([self isHighlighted]) {
        [[NSColor colorWithCalibratedWhite:0.9f alpha:1.0f] setFill];
    } else {
        [[NSColor colorWithCalibratedWhite:0.8f alpha:1.0f] setFill];
    }
    NSRectFill(fillFrame);
    
    // Now drawing tick
    if ([self intValue]) {
        
        if(![self isEnabled]) {
            [[NSColor grayColor] setFill];
        } else {
            [[NSColor blackColor] setFill];
        }
        NSRectFill(NSInsetRect(frame, 4, 4));
    }
}

@end
