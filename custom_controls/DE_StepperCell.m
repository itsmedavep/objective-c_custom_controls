//
//  DE_StepperCell.m
//  custom_controls
//
//  Created by David Palmer on 9/5/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_StepperCell.h"
#import "DE_Drawing.h"

@implementation DE_StepperCell

//- (void)setce

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
 
    // General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    // Moving origin over to draw @1x better
    cellFrame.origin.x = 0.5;
    cellFrame.origin.y = 0.5;
    
    // Color Declarations
    NSColor* sliderThumbGradientColor = [NSColor colorWithCalibratedRed: 0.216 green: 0.216 blue: 0.216 alpha: 1];
    NSColor* sliderThumbGradientColor2 = [NSColor colorWithCalibratedRed: 0.286 green: 0.286 blue: 0.286 alpha: 1];
    
    // Gradient Declarations
    NSGradient* sliderThumbGradient = [NSGradient.alloc initWithStartingColor: sliderThumbGradientColor2 endingColor: sliderThumbGradientColor];
    
    
    [NSGraphicsContext saveGraphicsState];
    
    // Rectangle Drawing
    CGFloat rectangleCornerRadius = 2;
    NSRect rectangleRect = NSMakeRect((cellFrame.origin.x), (cellFrame.origin.y), ((cellFrame.size.width) - 5), ((cellFrame.size.height) - 6));
    NSRect rectangleInnerRect = NSInsetRect(rectangleRect, rectangleCornerRadius, rectangleCornerRadius);
    NSBezierPath* rectanglePath = NSBezierPath.bezierPath;
    [rectanglePath moveToPoint: NSMakePoint(NSMinX(rectangleRect), NSMinY(rectangleRect))];
    [rectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangleInnerRect), NSMinY(rectangleInnerRect)) radius: rectangleCornerRadius startAngle: 270 endAngle: 360];
    [rectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangleInnerRect), NSMaxY(rectangleInnerRect)) radius: rectangleCornerRadius startAngle: 0 endAngle: 90];
    [rectanglePath lineToPoint: NSMakePoint(NSMinX(rectangleRect), NSMaxY(rectangleRect))];
    [rectanglePath closePath];
    [sliderThumbGradient drawInBezierPath: rectanglePath angle: -90];

    
    // Rectangle Inner Shadow
    NSRectClip(rectanglePath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, DE_Drawing.textBoxEdgeHighligh.shadowColor.alphaComponent);
    CGContextBeginTransparencyLayer(context, NULL);
    {
        NSShadow* opaqueShadow = NSShadow.alloc.init;
        opaqueShadow.shadowColor = [DE_Drawing.textBoxEdgeHighligh.shadowColor colorWithAlphaComponent: 1];
        opaqueShadow.shadowOffset = DE_Drawing.textBoxEdgeHighligh.shadowOffset;
        opaqueShadow.shadowBlurRadius = DE_Drawing.textBoxEdgeHighligh.shadowBlurRadius;
        [opaqueShadow set];
        
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow.shadowColor setFill];
        [rectanglePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    [DE_Drawing.textBoxStrokeColor setStroke];
    [rectanglePath setLineWidth: 1];
    [rectanglePath stroke];

    // chevronUpArrow
    {
        // Rectangle 2 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, NSMinX(cellFrame) + 5, NSMaxY(cellFrame) - 11);
        CGContextRotateCTM(context, 45 * M_PI / 180);
        
        NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle2Path fill];
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        // Rectangle 3 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, NSMinX(cellFrame) + 9, NSMaxY(cellFrame) - 11);
        CGContextRotateCTM(context, -45 * M_PI / 180);
        
        NSBezierPath* rectangle3Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle3Path fill];
        
        [NSGraphicsContext restoreGraphicsState];
    }
    
    
    // chevronDownArrow
    {
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, NSMinX(cellFrame) + 7, NSMaxY(cellFrame) - 21.5);
        CGContextRotateCTM(context, 180 * M_PI / 180);
        
        
        
        // Rectangle 4 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, -2, 0);
        CGContextRotateCTM(context, 45 * M_PI / 180);

        NSBezierPath* rectangle4Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle4Path fill];
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        // Rectangle 5 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, 2, 0);
        CGContextRotateCTM(context, -45 * M_PI / 180);
        
        NSBezierPath* rectangle5Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle5Path fill];
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        
        [NSGraphicsContext restoreGraphicsState];
    }
    
    
    // Rectangle 6 Drawing
    NSBezierPath* rectangle6Path = [NSBezierPath bezierPathWithRect: NSMakeRect(.5, ((cellFrame.size.height / 2) - 3), (cellFrame.size.width - 5), 1)];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.textBoxStrokeColor setFill];
    [rectangle6Path fill];
    [NSGraphicsContext restoreGraphicsState];

}

@end
