//
//  DE_Drawing.h
//  Custom_Controls
//
//  Created by David Palmer on 6/20/15.
//  Copyright (c) 2015 itsmedavep.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


@interface DE_Drawing : NSObject

// Colors
+ (NSColor*)sidePanelFillColor;
+ (NSColor*)sidePanelStrokeColor;
+ (NSColor*)upperShadowUpperStop;
+ (NSColor*)upperShadowBottomStop;
+ (NSColor*)upperShadowEdgeColor;
+ (NSColor*)lowerShadowUpperStop;
+ (NSColor*)lowerShadowLowerStop;
+ (NSColor*)sidePanelLeftHighlightColor;
+ (NSColor*)sidePanelRightHighlightColor;
+ (NSColor*)backgroundRectColor;
+ (NSColor*)textBoxOuterShadowColor;
+ (NSColor*)textBoxFillColor;
+ (NSColor*)textBoxStrokeColor;
+ (NSColor*)textBoxShadowColor;
+ (NSColor*)sliderThumbMiddleColor;

// Gradients
+ (NSGradient*)upperShadow;
+ (NSGradient*)lowerShadow;

// Shadows
+ (NSShadow*)sidePanelLeftHighlight;
+ (NSShadow*)sidePanelRightHighlight;
+ (NSShadow*)upperShadowEdge;
+ (NSShadow*)textBoxEdgeHighligh;
+ (NSShadow*)textBoxInnerShadow;
+ (NSShadow*)radioButtonEdgeHighlight;

// Drawing Methods
+ (void)drawStylingCanvas;
+ (void)drawTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth;
+ (void)drawSliderThumbWithFrame: (NSRect)frame;
+ (void)drawSliderWithFrame: (NSRect)frame sliderTrackCornerRadius: (CGFloat)sliderTrackCornerRadius;
+ (void)drawDrawGroupBoxWithFrame: (NSRect)frame textBoxCornerRadius: (CGFloat)textBoxCornerRadius;
+ (void)drawStepperCellWithStepperRightSideCornerRadius: (CGFloat)stepperRightSideCornerRadius;

// Generated Images
+ (NSImage*)imageOfStylingCanvas;
+ (NSImage*)imageOfTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth;

@end

@interface NSShadow (MyShadow)

+ (instancetype)shadowWithColor: (NSColor*)color offset: (CGSize)offset blurRadius: (CGFloat)blurRadius;


@end
