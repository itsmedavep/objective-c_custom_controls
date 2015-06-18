//
//  NSView+DE_Sidebar.m
//  custom_controls
//
//  Created by David Palmer on 6/17/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "NSView+DE_Sidebar.h"

@implementation NSView (DE_Sidebar)

-(void) drawRect:(NSRect)frame {
    
    [[NSColor redColor] set];
    [NSBezierPath fillRect:frame];
}

@end