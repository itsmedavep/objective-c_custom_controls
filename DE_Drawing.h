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

// Gradients
+ (NSGradient*)upperShadow;
+ (NSGradient*)lowerShadow;

// Shadows
+ (NSShadow*)sidePanelLeftHighlight;
+ (NSShadow*)sidePanelRightHighlight;
+ (NSShadow*)upperShadowEdge;
+ (NSShadow*)textBoxEdgeHighligh;

// Drawing Methods
+ (void)drawStylingCanvas;
+ (void)drawTextBoxBackgroundCanvasWithTextBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxRectangleX: (CGFloat)textBoxRectangleX textBoxRectangleY: (CGFloat)textBoxRectangleY textBoxWidth: (CGFloat)textBoxWidth textboxHeight: (CGFloat)textboxHeight textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth;

// Generated Images
+ (NSImage*)imageOfStylingCanvas;
+ (NSImage*)imageOfTextBoxBackgroundCanvasWithTextBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxRectangleX: (CGFloat)textBoxRectangleX textBoxRectangleY: (CGFloat)textBoxRectangleY textBoxWidth: (CGFloat)textBoxWidth textboxHeight: (CGFloat)textboxHeight textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth;

@end



@interface NSShadow (MyShadow)

+ (instancetype)shadowWithColor: (NSColor*)color offset: (CGSize)offset blurRadius: (CGFloat)blurRadius;


@end
