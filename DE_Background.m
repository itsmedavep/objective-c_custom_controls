//
//  DE_Background.m
//  custom_controls
//
//  Created by David Palmer on 6/20/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_Background.h"
#import "DE_Drawing.h"

@implementation DE_Background

- (void)drawRect:(NSRect)dirtyRect {
    
    [DE_Drawing drawStylingCanvas];
    
    [self setNeedsDisplayInRect:dirtyRect];
    
    // Drawing code here.
}

@end
