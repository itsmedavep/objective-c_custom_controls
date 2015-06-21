//
//  DE_ShadowBottom.m
//  custom_controls
//
//  Created by David Palmer on 6/21/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_ShadowBottom.h"
#import "DE_Drawing.h"

@implementation DE_ShadowBottom

- (void)drawRect:(NSRect)dirtyRect {
    
    [DE_Drawing drawShadowBottom];
    
    // Drawing code here.
}

@end
