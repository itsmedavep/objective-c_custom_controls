//
//  DE_MatrixCell.m
//  custom_controls
//
//  Created by David Palmer on 9/6/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_MatrixCell.h"
#import "DE_Drawing.h"

@implementation DE_MatrixCell

- (void)drawImage:(NSImage *)image
        withFrame:(NSRect)frame
           inView:(NSView *)controlView {
    
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    
    
    
//        //// Oval Drawing
//        NSBezierPath* ovalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect((frame.origin.x), (frame.origin.y), (frame.size.width), (frame.size.height))];
//        [DE_Drawing.textBoxFillColor setFill];
//        [ovalPath fill];
//
//
//        //// radioButton Drawing
//        NSBezierPath* radioButtonPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(((frame.origin.x) + 5.5), ((frame.origin.y) + 5.5), ((frame.size.width) * .4), ((frame.size.height) * .4))];
//        [DE_Drawing.sliderThumbMiddleColor setFill];
//        [radioButtonPath fill];
    
    // Drawing
//    if(![self isEnabled]) {
//        
//        //// Oval Drawing
//        NSBezierPath* ovalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect((frame.origin.x), (frame.origin.y), (frame.size.width), (frame.size.height))];
//        [DE_Drawing.textBoxFillColor setFill];
//        [ovalPath fill];
//        
//        
//        //// radioButton Drawing
//        NSBezierPath* radioButtonPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(((frame.origin.x) + 5.5), ((frame.origin.y) + 5.5), ((frame.size.width) * .4), ((frame.size.height) * .4))];
//        [DE_Drawing.sliderThumbMiddleColor setFill];
//        [radioButtonPath fill];
//
//        
//    } else {
//        
//        //// Oval Drawing
//        NSBezierPath* ovalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect((frame.origin.x), (frame.origin.y), (frame.size.width), (frame.size.height))];
//        [DE_Drawing.textBoxFillColor setFill];
//        [ovalPath fill];
//        
//        
//        //// radioButton Drawing
//        NSBezierPath* radioButtonPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(((frame.origin.x) + 5.5), ((frame.origin.y) + 5.5), ((frame.size.width) * .4), ((frame.size.height) * .4))];
//        [DE_Drawing.sliderThumbMiddleColor setFill];
//        [radioButtonPath fill];
//
//    }
    // Now drawing selection
    if ([self intValue]) {
        
        //// Oval Drawing
        NSBezierPath* ovalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect((frame.origin.x + 1.5), (frame.origin.y + 1.5), (frame.size.width- 2), (frame.size.height - 2))];
        [DE_Drawing.textBoxFillColor setFill];
        [DE_Drawing.radioButtonEdgeHighlight set];
        [ovalPath fill];
            
            ////// Oval Inner Shadow
            [NSGraphicsContext saveGraphicsState];
//            NSRectClip(ovalPath.bounds);
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
                [ovalPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            [NSGraphicsContext restoreGraphicsState];
            
            [DE_Drawing.textBoxStrokeColor setStroke];
            [ovalPath setLineWidth: 1];
            [ovalPath stroke];
        
        //// radioButton Drawing
        NSBezierPath* radioButtonPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(((frame.origin.x) + 6.5), ((frame.origin.y) + 6.5), ((frame.size.width) * .33), ((frame.size.height) * .33))];
        [DE_Drawing.sliderThumbMiddleColor setFill];
        [radioButtonPath fill];

        } else {
            
            //// Oval Drawing
            NSBezierPath* ovalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect((frame.origin.x + 1.5), (frame.origin.y + 1.5), (frame.size.width - 2), (frame.size.height - 2))];
            [DE_Drawing.textBoxFillColor setFill];
            [DE_Drawing.radioButtonEdgeHighlight set];
            [ovalPath fill];
            
            ////// Oval Inner Shadow
            [NSGraphicsContext saveGraphicsState];
//            NSRectClip(ovalPath.bounds);
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
                [ovalPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            [NSGraphicsContext restoreGraphicsState];
            
            [DE_Drawing.textBoxStrokeColor setStroke];
            [ovalPath setLineWidth: 1];
            [ovalPath stroke];
            
//            //// radioButton Drawing
//            NSBezierPath* radioButtonPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(((frame.origin.x) + 5.5), ((frame.origin.y) + 5.5), ((frame.size.width) * .4), ((frame.size.height) * .4))];
//            [DE_Drawing.textBoxFillColor setFill];
//            [radioButtonPath fill];
            
        }
}

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
//    Save Graphics Context
    [NSGraphicsContext saveGraphicsState];
    
    frame.origin.x = 22;
    
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
