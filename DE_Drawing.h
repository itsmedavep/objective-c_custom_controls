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
+ (NSColor*)backgroundPlugColor;
+ (NSColor*)gradientColor;

// Gradients
+ (NSGradient*)shadowGradient;

// Corner Radius
+ (NSInteger*)cornerRadius;

+ (CGFloat*)sidePanelHeight;
+ (CGFloat*)sidePanelWidth;

// Drawing Methods
+ (void)drawSidePanelWithSidePanelFrame: (NSRect)sidePanelFrame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight;
+ (void)drawBackgroundPlugWithBackgroundWidth: (CGFloat)backgroundWidth backgroundHeight: (CGFloat)backgroundHeight;
+ (void)drawShadowTop;
+ (void)drawShadowBottom;

// Generated Images
+ (NSImage*)imageOfSidePanelWithSidePanelFrame: (NSRect)sidePanelFrame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight;
+ (NSImage*)imageOfBackgroundPlugWithBackgroundWidth: (CGFloat)backgroundWidth backgroundHeight: (CGFloat)backgroundHeight;
+ (NSImage*)imageOfShadowTop;
+ (NSImage*)imageofShadowBottom;


@end
