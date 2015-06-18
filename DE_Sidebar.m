//
//  DE_Sidebar.m
//  custom_controls
//
//  Created by David Palmer on 6/17/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_Sidebar.h"

@implementation DE_Sidebar

- (void)drawRect:(NSRect)frame {
    
    
    //// Shadow Declarations
    NSShadow* shadowSidePanel = NSShadow.alloc.init;
    [shadowSidePanel setShadowColor: NSColor.blackColor];
    [shadowSidePanel setShadowOffset: NSMakeSize(0.1, 0.1)];
    [shadowSidePanel setShadowBlurRadius: 15];
    
    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: NSMakeRect(NSMinX(frame) + 0.5, NSMinY(frame) - 3.5, 39, 105)];
    [NSGraphicsContext saveGraphicsState];
    [shadowSidePanel set];
    [NSColor.darkGrayColor setFill];
    [rectanglePath fill];
    [NSGraphicsContext restoreGraphicsState];
    
    [NSColor.blackColor setStroke];
    [rectanglePath setLineWidth: 4];
    [rectanglePath stroke];
    
    [self setNeedsDisplay:YES];
    
    // Drawing code here.
}

@end
