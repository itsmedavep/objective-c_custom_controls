//
//  DE_ShadowTop.m
//  custom_controls
//
//  Created by David Palmer on 6/20/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_ShadowTop.h"
#import "DE_Drawing.h"

@implementation DE_ShadowTop

- (void)drawRect:(NSRect)dirtyRect {
    
    [DE_Drawing drawShadowTop];
    
    // Drawing code here.
}

@end
