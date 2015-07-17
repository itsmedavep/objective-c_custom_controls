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
    
    //  [super drawBarInside:rect flipped:flipped];
    
    aRect.size.height = 5.0;
    
    // Bar radius
    CGFloat barRadius = 2.5;
    
    // Knob position depending on control min/max value and current control value.
    CGFloat value = ([self doubleValue]  - [self minValue]) / ([self maxValue] - [self minValue]);
    
    // Final Left Part Width
    CGFloat finalWidth = value * ([[self controlView] frame].size.width - 8);
    
    // Left Part Rect
    NSRect leftRect = aRect;
    leftRect.size.width = finalWidth;
    
//    NSLog(@"- Current Rect:%@ \n- Value:%f \n- Final Width:%f", NSStringFromRect(aRect), value, finalWidth);
    
    // Draw Left Part
    NSBezierPath* bg = [NSBezierPath bezierPathWithRoundedRect: aRect xRadius: barRadius yRadius: barRadius];
    [NSColor.darkGrayColor setFill];
    [bg fill];
    
    
    // Draw Right Part
    NSBezierPath* active = [NSBezierPath bezierPathWithRoundedRect: leftRect xRadius: barRadius yRadius: barRadius];
    [NSColor.orangeColor setFill];
    [active fill];
    [NSColor.blackColor setStroke];
    [bg stroke];
    
}

@end
