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

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
 
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    //// Color Declarations
    NSColor* sliderThumbGradientColor = [NSColor colorWithCalibratedRed: 0.216 green: 0.216 blue: 0.216 alpha: 1];
    NSColor* sliderThumbGradientColor2 = [NSColor colorWithCalibratedRed: 0.286 green: 0.286 blue: 0.286 alpha: 1];
    
    //// Gradient Declarations
    NSGradient* sliderThumbGradient = [NSGradient.alloc initWithStartingColor: sliderThumbGradientColor2 endingColor: sliderThumbGradientColor];
    
    //// Rectangle Drawing
    CGFloat rectangleCornerRadius = 2;
    NSRect rectangleRect = NSMakeRect(0, 0, (cellFrame.size.width), (cellFrame.size.height));
    NSRect rectangleInnerRect = NSInsetRect(rectangleRect, rectangleCornerRadius, rectangleCornerRadius);
    NSBezierPath* rectanglePath = NSBezierPath.bezierPath;
    [rectanglePath moveToPoint: NSMakePoint(NSMinX(rectangleRect), NSMinY(rectangleRect))];
    [rectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangleInnerRect), NSMinY(rectangleInnerRect)) radius: rectangleCornerRadius startAngle: 270 endAngle: 360];
    [rectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(rectangleInnerRect), NSMaxY(rectangleInnerRect)) radius: rectangleCornerRadius startAngle: 0 endAngle: 90];
    [rectanglePath lineToPoint: NSMakePoint(NSMinX(rectangleRect), NSMaxY(rectangleRect))];
    [rectanglePath closePath];
    [sliderThumbGradient drawInBezierPath: rectanglePath angle: -90];
    
    ////// Rectangle Inner Shadow
    [NSGraphicsContext saveGraphicsState];
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
    
    
    //// chevronUpArrow
    {
        //// Rectangle 2 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, 9.5, 34.5);
        CGContextRotateCTM(context, 45 * M_PI / 180);
        
        NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle2Path fill];
        
        ////// Rectangle 2 Inner Shadow
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(rectangle2Path.bounds);
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
            [rectangle2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        //// Rectangle 3 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, 13.5, 34.5);
        CGContextRotateCTM(context, -45 * M_PI / 180);
        
        NSBezierPath* rectangle3Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle3Path fill];
        
        ////// Rectangle 3 Inner Shadow
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(rectangle3Path.bounds);
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
            [rectangle3Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        
        [NSGraphicsContext restoreGraphicsState];
    }
    
    
    //// chevronDownArrow
    {
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, 11.5, 13.5);
        CGContextRotateCTM(context, 180 * M_PI / 180);
        
        
        
        //// Rectangle 4 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, -2, 0);
        CGContextRotateCTM(context, 45 * M_PI / 180);
        
        NSBezierPath* rectangle4Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle4Path fill];
        
        ////// Rectangle 4 Inner Shadow
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(rectangle4Path.bounds);
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
            [rectangle4Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        //// Rectangle 5 Drawing
        [NSGraphicsContext saveGraphicsState];
        CGContextTranslateCTM(context, 2, 0);
        CGContextRotateCTM(context, -45 * M_PI / 180);
        
        NSBezierPath* rectangle5Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-4, -1, 8, 2) xRadius: 1 yRadius: 1];
        [NSColor.whiteColor setFill];
        [rectangle5Path fill];
        
        ////// Rectangle 5 Inner Shadow
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(rectangle5Path.bounds);
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
            [rectangle5Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        
        [NSGraphicsContext restoreGraphicsState];
        
        
        
        [NSGraphicsContext restoreGraphicsState];
    }
    
    
    //// Rectangle 6 Drawing
    NSBezierPath* rectangle6Path = [NSBezierPath bezierPathWithRect: NSMakeRect(3, 24, 17, 1)];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.textBoxEdgeHighligh set];
    [DE_Drawing.textBoxStrokeColor setFill];
    [rectangle6Path fill];
    [NSGraphicsContext restoreGraphicsState];
    
}

@end
