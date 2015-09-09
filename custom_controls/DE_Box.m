//
//  DE_Box.m
//  custom_controls
//
//  Created by David Palmer on 9/4/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//
//
//  RoundedBox.m
//  RoundedBox
//
//  Created by Matt Gemmell on 01/11/2005.
//  Copyright 2006 Matt Gemmell. http://mattgemmell.com/
//
//  Permission to use this code:
//
//  Feel free to use this code in your software, either as-is or
//  in a modified form. Either way, please include a credit in
//  your software's "About" box or similar, mentioning at least
//  my name (Matt Gemmell). A link to my site would be nice too.
//
//  Permission to redistribute this code:
//
//  You can redistribute this code, as long as you keep these
//  comments. You can also redistribute modified versions of the
//  code, as long as you add comments to say that you've made
//  modifications (keeping these original comments too).
//
//  If you do use or redistribute this code, an email would be
//  appreciated, just to let me know that people are finding my
//  code useful. You can reach me at matt.gemmell@gmail.com
//

#import "DE_Box.h"

@implementation DE_Box

- (void)setDefaults
{
    _drawsTitle = YES;
    [[self titleCell] setLineBreakMode:NSLineBreakByTruncatingTail];
    [self setTitleColor:[NSColor whiteColor]];
}

- (void)awakeFromNib
{
    [self setDefaults];
}


- (BOOL)preservesContentDuringLiveResize
{
    return NO;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    // Create drawing rectangle for title
    
    NSDictionary *titleAttrs = [[[self titleCell] attributedStringValue] attributesAtIndex:0
                                                                            effectiveRange:NULL];
    NSSize titleSize = [[self title] sizeWithAttributes:titleAttrs];
    NSRect titleRect = NSMakeRect(dirtyRect.origin.x,
                                  dirtyRect.origin.y + dirtyRect.size.height - titleSize.height,
                                  (titleSize.width + 4),
                                  titleSize.height);
    titleRect.size.width = MIN((titleRect.size.width) + 2, dirtyRect.size.width);
    
    dirtyRect.size.height = ((dirtyRect.size.height - titleRect.size.height) - 2);
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:dirtyRect textBoxCornerRadius:4 textBoxStrokeWidth:1];

    if (_drawsTitle) {
        [[self titleCell] drawInteriorWithFrame:titleRect inView:self];
    }
    
    [self setNeedsDisplay:YES];
}

- (NSBezierPath *)titlePathWithinRect:(NSRect)rect cornerRadius:(float)radius titleRect:(NSRect)titleRect
{
    // Construct rounded rect path
    
    NSRect bgRect = rect;
    int minX = NSMinX(bgRect);
    int maxX = minX + titleRect.size.width + ((titleRect.origin.x - rect.origin.x) * 2.0);
    int maxY = NSMaxY(bgRect);
    int minY = NSMinY(titleRect) - (maxY - (titleRect.origin.y + titleRect.size.height));
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint:NSMakePoint(minX, minY)];
    
        // Draw a short titlebar
        [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, minY)
                                       toPoint:NSMakePoint(maxX, maxY)
                                        radius:radius];
        [path lineToPoint:NSMakePoint(maxX, maxY)];
   
    
    [path appendBezierPathWithArcFromPoint:NSMakePoint(minX, maxY)
                                   toPoint:NSMakePoint(minX, minY)
                                    radius:radius];
    
    [path closePath];
    
    return path;
}


- (void)setTitle:(NSString *)newTitle
{
    [super setTitle:newTitle];
    [[self window] invalidateCursorRectsForView:self];
    [self setNeedsDisplay:YES];
}

- (NSColor *)titleColor
{
    return titleColor;
}

- (void)setTitleColor:(NSColor *)newTitleColor
{
    [[self titleCell] setTextColor:newTitleColor];
    [self setNeedsDisplay:YES];
}

@end
