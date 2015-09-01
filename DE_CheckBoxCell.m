//
//  DE_CheckBoxCell.m
//  custom_controls
//
//  Created by David Palmer on 8/13/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_CheckBoxCell.h"
#import "DE_Drawing.h"

@implementation DE_CheckBoxCell

- (void)drawImage:(NSImage *)image
        withFrame:(NSRect)frame
           inView:(NSView *)controlView {
    
    // Drawing
    if(![self isEnabled]) {
        
        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:(frame) textBoxCornerRadius:(2) textBoxStrokeWidth:(1)];
//        [[NSColor clearColor] setFill];
        
    } else {
        
        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:(frame) textBoxCornerRadius:(2) textBoxStrokeWidth:(1)];
//        [[NSColor clearColor] setFill];
    }
//
//    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)frame textBoxCornerRadius: (2)textBoxStrokeWidth: (1)];
    
    
//    NSRectFill(NSInsetRect(frame, 1, 1));
//    NSRect fillFrame = NSInsetRect(frame, 2, 2);
    
    // Drawing inner contents
//    if([self isHighlighted]) {
//        
//        [[NSColor greenColor] setFill];
//        
//    } else {
//        
//        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:(frame) textBoxCornerRadius:(2) textBoxStrokeWidth:(1)];
////        [[NSColor clearColor] setFill];
//    }
//    NSRectFill(fillFrame);
    
    // Now drawing tick
    if ([self intValue]) {
        
        if(![self isEnabled]) {
            [[NSColor redColor] setFill];
        } else {
            
            //// Bezier Drawing
            
            //// General Declarations
            CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
            
            //// Rectangle Drawing
            [NSGraphicsContext saveGraphicsState];
            CGContextTranslateCTM(context, frame.origin.x + 6, frame.origin.y + 10);
            CGContextRotateCTM(context, -135 * M_PI / 180);
            
            NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-3.5, -1, 7, 2) xRadius: 1 yRadius: 1];
            [DE_Drawing.sliderThumbMiddleColor setFill];
            [rectanglePath fill];
            
            [NSGraphicsContext restoreGraphicsState];
            
            
            //// Rectangle 2 Drawing
            [NSGraphicsContext saveGraphicsState];
            CGContextTranslateCTM(context, frame.origin.x + 11.05, frame.origin.y + 8.21);
            CGContextRotateCTM(context, 34.68 * M_PI / 180);
            
            NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-1, -5.96, 2, 11.93) xRadius: 1 yRadius: 1];
            [DE_Drawing.sliderThumbMiddleColor setFill];
            [rectangle2Path fill];
            
            [NSGraphicsContext restoreGraphicsState];
            
//            NSMakeRect(0, 0, frame.size.width, frame.size.height);
//            [[NSColor greenColor] setFill];
            
//            NSAffineTransform *myTransform = [NSAffineTransform transform];
//            [myTransform translateXBy:0 yBy:frame.size.height * 1.5];
//            [myTransform scaleXBy:1 yBy:-1];
//            
////            [myTransform translateXBy: 0 yBy: cellSize.height];
////            [myTransform scaleXBy: 1.0 scaleYBy: -1];
//            
//            [NSGraphicsContext saveGraphicsState];
//            [myTransform concat];
//            
//            NSBezierPath* bezierPath = NSBezierPath.bezierPath;
//            [bezierPath moveToPoint: NSMakePoint(13.76, 10.75)];
//            [bezierPath curveToPoint: NSMakePoint(13.76, 9.54) controlPoint1: NSMakePoint(14.08, 10.42) controlPoint2: NSMakePoint(14.08, 9.87)];
//            [bezierPath curveToPoint: NSMakePoint(6.77, 2.31) controlPoint1: NSMakePoint(13.76, 9.54) controlPoint2: NSMakePoint(8.35, 3.95)];
//            [bezierPath curveToPoint: NSMakePoint(6.55, 1.87) controlPoint1: NSMakePoint(6.74, 2.15) controlPoint2: NSMakePoint(6.67, 2)];
//            [bezierPath curveToPoint: NSMakePoint(5.86, 1.63) controlPoint1: NSMakePoint(6.36, 1.68) controlPoint2: NSMakePoint(6.1, 1.6)];
//            [bezierPath curveToPoint: NSMakePoint(5.17, 1.87) controlPoint1: NSMakePoint(5.62, 1.6) controlPoint2: NSMakePoint(5.36, 1.68)];
//            [bezierPath curveToPoint: NSMakePoint(4.95, 2.31) controlPoint1: NSMakePoint(5.05, 2) controlPoint2: NSMakePoint(4.98, 2.15)];
//            [bezierPath curveToPoint: NSMakePoint(1.86, 5.5) controlPoint1: NSMakePoint(4.01, 3.28) controlPoint2: NSMakePoint(1.86, 5.5)];
//            [bezierPath curveToPoint: NSMakePoint(1.62, 6.11) controlPoint1: NSMakePoint(1.7, 5.67) controlPoint2: NSMakePoint(1.62, 5.89)];
//            [bezierPath curveToPoint: NSMakePoint(1.86, 6.71) controlPoint1: NSMakePoint(1.62, 6.33) controlPoint2: NSMakePoint(1.7, 6.55)];
//            [bezierPath curveToPoint: NSMakePoint(3.03, 6.71) controlPoint1: NSMakePoint(2.19, 7.05) controlPoint2: NSMakePoint(2.71, 7.05)];
//            [bezierPath curveToPoint: NSMakePoint(5.86, 3.79) controlPoint1: NSMakePoint(3.03, 6.71) controlPoint2: NSMakePoint(4.84, 4.85)];
//            [bezierPath curveToPoint: NSMakePoint(12.59, 10.75) controlPoint1: NSMakePoint(7.7, 5.69) controlPoint2: NSMakePoint(12.59, 10.75)];
//            [bezierPath curveToPoint: NSMakePoint(13.76, 10.75) controlPoint1: NSMakePoint(12.91, 11.08) controlPoint2: NSMakePoint(13.43, 11.08)];
//            [bezierPath closePath];
//            [NSColor.whiteColor setFill];
//            [bezierPath fill];
//            
////            [[NSColor greenColor] setFill];
//            
//            [NSGraphicsContext restoreGraphicsState];
        }
        
//        NSRectFill(NSInsetRect(frame, 0, 0));
    }
}

@end
