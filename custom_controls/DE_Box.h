//
//  DE_Box.h
//  custom_controls
//
//  Created by David Palmer on 9/4/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DE_Drawing.h"

@interface DE_Box : NSBox {
    
    BOOL _drawsTitle;
    NSColor *titleColor;
    NSRect titlePathRect;
    
}

- (void)setDefaults;
- (NSBezierPath *)titlePathWithinRect:(NSRect)rect cornerRadius:(float)radius titleRect:(NSRect)titleRect;
- (NSColor *)titleColor;
- (void)setTitleColor:(NSColor *)newTitleColor;

@end
