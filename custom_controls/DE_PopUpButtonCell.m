//
//  DE_PopUpButtonCell.m
//  custom_controls
//
//  Created by David Palmer on 9/6/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_PopUpButtonCell.h"
#import "DE_Drawing.h"

@implementation DE_PopUpButtonCell

- (void)drawImageWithFrame:(NSRect)cellFrame
                    inView:(NSView *)controlView {
    
    [super drawImageWithFrame:cellFrame inView:controlView];
    
    // TODO:Move this over to DE_Drawing
    
    // Moving origin for @1x drawing
    cellFrame.origin.x = .5;
    cellFrame.origin.y = .5;
    
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    // Color Declarations
    NSColor* sliderThumbGradientColor = [NSColor colorWithCalibratedRed: 0.216 green: 0.216 blue: 0.216 alpha: 1];
    NSColor* sliderThumbGradientColor2 = [NSColor colorWithCalibratedRed: 0.286 green: 0.286 blue: 0.286 alpha: 1];
    NSColor* color = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    NSColor* popUpButtonChevronButtonColor = [NSColor colorWithCalibratedRed: 0.482 green: 0.482 blue: 0.482 alpha: 1];
    NSColor* popUpButtonChevronButtonColor2 = [NSColor colorWithCalibratedRed: 0.168 green: 0.168 blue: 0.168 alpha: 1];
    
    // Gradient Declarations
    NSGradient* sliderThumbGradient = [NSGradient.alloc initWithStartingColor: sliderThumbGradientColor2 endingColor: sliderThumbGradientColor];
    NSGradient* popUpButtonChevronButton = [NSGradient.alloc initWithColorsAndLocations:
                                            popUpButtonChevronButtonColor2, 0.31,
                                            popUpButtonChevronButtonColor, 1.0, nil];
    
    // Background Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(NSMinX(cellFrame), NSMinY(cellFrame), (cellFrame.size.width - 3), (cellFrame.size.height - 3)) xRadius: 4 yRadius: 4];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.textBoxEdgeHighligh set];
    CGContextBeginTransparencyLayer(context, NULL);
    [sliderThumbGradient drawInBezierPath: rectanglePath angle: 90];
    CGContextEndTransparencyLayer(context);
    
    // Background Rectangle Inner Shadow
    [NSGraphicsContext saveGraphicsState];
    NSRectClip(rectanglePath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, DE_Drawing.textBoxInnerShadow.shadowColor.alphaComponent);
    CGContextBeginTransparencyLayer(context, NULL);
    {
        NSShadow* opaqueShadow = NSShadow.alloc.init;
        opaqueShadow.shadowColor = [DE_Drawing.textBoxInnerShadow.shadowColor colorWithAlphaComponent: 1];
        opaqueShadow.shadowOffset = DE_Drawing.textBoxInnerShadow.shadowOffset;
        opaqueShadow.shadowBlurRadius = DE_Drawing.textBoxInnerShadow.shadowBlurRadius;
        [opaqueShadow set];
        
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow.shadowColor setFill];
        [rectanglePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    [NSGraphicsContext restoreGraphicsState];
    
    [DE_Drawing.textBoxStrokeColor setStroke];
    [rectanglePath setLineWidth: 1];
    [rectanglePath stroke];
    
    
    // Popup Button Drawing
    CGFloat rectangle2CornerRadius = 4;
    NSRect rectangle2Rect = NSMakeRect(NSMinX(cellFrame) + 77.5, NSMinY(cellFrame), 20, (cellFrame.size.height - 3));
    NSRect rectangle2InnerRect = NSInsetRect(rectangle2Rect, rectangle2CornerRadius, rectangle2CornerRadius);
    NSBezierPath* rectangle2Path = NSBezierPath.bezierPath;
    [rectangle2Path moveToPoint: NSMakePoint(NSMinX(rectangle2Rect), NSMinY(rectangle2Rect))];
    [rectangle2Path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangle2InnerRect), NSMinY(rectangle2InnerRect)) radius: rectangle2CornerRadius startAngle: 270 endAngle: 360];
    [rectangle2Path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangle2InnerRect), NSMaxY(rectangle2InnerRect)) radius: rectangle2CornerRadius startAngle: 0 endAngle: 90];
    [rectangle2Path lineToPoint: NSMakePoint(NSMinX(rectangle2Rect), NSMaxY(rectangle2Rect))];
    [rectangle2Path closePath];
    [popUpButtonChevronButton drawInBezierPath: rectangle2Path angle: -90];
    [DE_Drawing.textBoxStrokeColor setStroke];
    [rectangle2Path setLineWidth: 1];
    [rectangle2Path stroke];
    
    // Popup Button Divider line Drawing
    NSBezierPath* bezierPath = NSBezierPath.bezierPath;
    [bezierPath moveToPoint: NSMakePoint(NSMinX(cellFrame) + 77.5, NSMaxY(cellFrame) - 14.5)];
    [bezierPath lineToPoint: NSMakePoint(NSMinX(cellFrame) + 97.5, NSMaxY(cellFrame) - 14.5)];
    [bezierPath lineToPoint: NSMakePoint(NSMinX(cellFrame) + 97.5, NSMaxY(cellFrame) - 14.5)];
    [bezierPath closePath];
    [NSColor.grayColor setFill];
    [bezierPath fill];
    [color setStroke];
    [bezierPath setLineWidth: 1];
    [bezierPath stroke];
    
}

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
    // Save Graphics Context
    [NSGraphicsContext saveGraphicsState];
    
    // Offsetting frame so that the text draws in an agreeable place
    // TODO: Fix this so that the text is in the correct position
    frame.origin.x = 6;
    
    // Draw title with whiteColor
    NSMutableAttributedString *attrString = [title mutableCopy];
    [attrString beginEditing];
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:NSMakeRange(0, [[self title] length])];
    [attrString endEditing];
    NSRect titleRect = [super drawTitle:attrString withFrame:frame inView:controlView];
    
    // Restore graphics state
    [NSGraphicsContext restoreGraphicsState];
    return titleRect;
}

@end
