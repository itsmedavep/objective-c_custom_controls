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

// Gradients
+ (NSGradient*)upperShadow;
+ (NSGradient*)lowerShadow;

// Shadows
+ (NSShadow*)sidePanelLeftHighlight;
+ (NSShadow*)sidePanelRightHighlight;
+ (NSShadow*)upperShadowEdge;

// Drawing Methods
+ (void)drawStylingCanvas;

// Generated Images
+ (NSImage*)imageOfStylingCanvas;

@end



@interface NSShadow (MyShadow)

+ (instancetype)shadowWithColor: (NSColor*)color offset: (CGSize)offset blurRadius: (CGFloat)blurRadius;


@end
