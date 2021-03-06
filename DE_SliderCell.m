//
//  DE_SliderCell.m
//  custom_controls
//
//  Created by David Palmer on 7/12/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_SliderCell.h"
#import "DE_Drawing.h"

@implementation DE_SliderCell

- (void)drawKnob:(NSRect)frame {
    
    [super drawKnob:frame];
    
    [DE_Drawing drawSliderThumbWithFrame:frame];
}

-(void)drawBarInside:(NSRect)aRect flipped:(BOOL)flipped {
    
    //    TODO: Move all of this over to DE_Drawing
    
    // General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    if (aRect.size.height >= aRect.size.width) {
        
        // Draw Vertical Slider
        
        aRect.size.width = 5;
        
        // Bar radius
        CGFloat barRadius = 2.5;
        
        // Knob position depending on control min/max value and current control value.
        CGFloat value = ([self doubleValue]  - [self maxValue]) / ([self minValue] - [self maxValue] - 4);
        
        // Final Left Part Width
        CGFloat finalHeight = value * ([[self controlView] frame].size.height - 2);
        
        // Top Part Rect
        NSRect leftRect = aRect;
        leftRect.size.height = finalHeight;
        
        NSColor* sliderTrackStrokeColor = [NSColor colorWithCalibratedRed: 0.208 green: 0.208 blue: 0.208 alpha: 1];
        
        // Draw Top Part
        NSBezierPath* bg = [NSBezierPath bezierPathWithRoundedRect: aRect xRadius: barRadius yRadius: barRadius];
        [DE_Drawing.textBoxFillColor  setFill];
        [bg fill];
        [DE_Drawing.textBoxStrokeColor setStroke];
        [bg stroke];
        
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
            [bg fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        [NSGraphicsContext saveGraphicsState];
        
        // Draw Bottom Part
        NSBezierPath* active = [NSBezierPath bezierPathWithRoundedRect: leftRect xRadius: barRadius yRadius: barRadius];
        [DE_Drawing.sliderThumbMiddleColor setFill];
        [active fill];
        [sliderTrackStrokeColor setStroke];
        [active stroke];
        
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
            [active fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
    }
    
    else {
    
    // Draw Horizontal Slider
        
    aRect.size.height = 5;
    
    // Bar radius
    CGFloat barRadius = 2.5;
    
    // Knob position depending on control min/max value and current control value.
    CGFloat value = ([self doubleValue]  - [self minValue]) / ([self maxValue] - [self minValue]);
    
    // Final Left Part Width
    CGFloat finalWidth = value * ([[self controlView] frame].size.width - 8);
    
    // Left Part Rect
    NSRect leftRect = aRect;
    leftRect.size.width = finalWidth;
    
    NSColor* sliderTrackStrokeColor = [NSColor colorWithCalibratedRed: 0.208 green: 0.208 blue: 0.208 alpha: 1];
    
    [NSGraphicsContext saveGraphicsState];
        
    // Draw Left Part
    NSBezierPath* bg = [NSBezierPath bezierPathWithRoundedRect: aRect xRadius: barRadius yRadius: barRadius];
    [DE_Drawing.textBoxFillColor  setFill];
    [bg fill];
    [DE_Drawing.textBoxStrokeColor setStroke];
    [bg stroke];

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
        [bg fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    // Draw Right Part
    NSBezierPath* active = [NSBezierPath bezierPathWithRoundedRect: leftRect xRadius: barRadius yRadius: barRadius];
    [DE_Drawing.sliderThumbMiddleColor setFill];
    [active fill];
    [sliderTrackStrokeColor setStroke];
    [active stroke];
    
    [NSGraphicsContext saveGraphicsState];
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
        [active fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    }
}
@end
