//
//  DE_Box.m
//  custom_controls
//
//  Created by David Palmer on 9/4/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_Box.h"

@implementation DE_Box

- (void)setDefaults
{
    _drawsTitle = YES;
    [[self titleCell] setLineBreakMode:NSLineBreakByTruncatingTail];
//    [[self titleCell] setEditable:YES];
    
    [self setTitleColor:[NSColor whiteColor]];
//    [self setTitleFont:[NSFont boldSystemFontOfSize:[NSFont systemFontSizeForControlSize:NSSmallControlSize]]];
}

- (void)awakeFromNib
{
    // For when we've been created in a nib file
    [self setDefaults];
}


- (BOOL)preservesContentDuringLiveResize
{
    // NSBox returns YES for this, but doing so would screw up the gradients.
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

    
    // Draw title background
//    NSBezierPath *titlePath = [self titlePathWithinRect:dirtyRect cornerRadius:0 titleRect:titleRect];
//    [titlePath fill];
//    titlePathRect = [titlePath bounds];
    
    // Draw title text using the titleCell
    if (_drawsTitle) {
        [[self titleCell] drawInteriorWithFrame:titleRect inView:self];
    }
}

- (NSBezierPath *)titlePathWithinRect:(NSRect)rect cornerRadius:(float)radius titleRect:(NSRect)titleRect
{
    // Construct rounded rect path
    
    NSRect bgRect = rect;
    int minX = NSMinX(bgRect);
    int maxX = minX + titleRect.size.width + ((titleRect.origin.x - rect.origin.x) * 2.0);
    int maxY = NSMaxY(bgRect);
    int minY = NSMinY(titleRect) - (maxY - (titleRect.origin.y + titleRect.size.height));
    float titleExpansionThreshold = 20.0;
    // i.e. if there's less than 20px space to the right of the short titlebar, just draw the full one.
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint:NSMakePoint(minX, minY)];
    
    if (bgRect.size.width - titleRect.size.width >= titleExpansionThreshold && _drawsTitle) {
        // Draw a short titlebar
        [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, minY)
                                       toPoint:NSMakePoint(maxX, maxY)
                                        radius:radius];
        [path lineToPoint:NSMakePoint(maxX, maxY)];
    } else {
        // Draw full titlebar, since we're either set to always do so, or we don't have room for a short one.
        [path lineToPoint:NSMakePoint(NSMaxX(bgRect), minY)];
        [path appendBezierPathWithArcFromPoint:NSMakePoint(NSMaxX(bgRect), maxY)
                                       toPoint:NSMakePoint(NSMaxX(bgRect) - (bgRect.size.width / 2.0), maxY)
                                        radius:radius];
    }
    
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
