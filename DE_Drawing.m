//
//  DE_Drawing.m
//  Custom_Controls
//
//  Created by David Palmer on 6/20/15.
//  Copyright (c) 2015 itsmedavep.com. All rights reserved.
//
//
//

#import "DE_Drawing.h"


@implementation DE_Drawing

#pragma mark Cache

static NSColor* _sidePanelFillColor = nil;
static NSColor* _sidePanelStrokeColor = nil;
static NSColor* _upperShadowUpperStop = nil;
static NSColor* _upperShadowBottomStop = nil;
static NSColor* _upperShadowEdgeColor = nil;
static NSColor* _lowerShadowUpperStop = nil;
static NSColor* _lowerShadowLowerStop = nil;
static NSColor* _sidePanelLeftHighlightColor = nil;
static NSColor* _sidePanelRightHighlightColor = nil;
static NSColor* _backgroundRectColor = nil;

static NSGradient* _upperShadow = nil;
static NSGradient* _lowerShadow = nil;

static NSShadow* _sidePanelLeftHighlight = nil;
static NSShadow* _sidePanelRightHighlight = nil;
static NSShadow* _upperShadowEdge = nil;

static NSImage* _imageOfStylingCanvas = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _sidePanelFillColor = [NSColor colorWithCalibratedRed: 0.173 green: 0.173 blue: 0.173 alpha: 1];
    _sidePanelStrokeColor = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    _upperShadowUpperStop = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    _upperShadowBottomStop = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 0];
    _upperShadowEdgeColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    _lowerShadowUpperStop = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 0];
    _lowerShadowLowerStop = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    _sidePanelLeftHighlightColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 0.25];
    _sidePanelRightHighlightColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 0.25];
    _backgroundRectColor = [NSColor colorWithCalibratedRed: 0.293 green: 0.293 blue: 0.293 alpha: 1];
    
    // Gradients Initialization
    _upperShadow = [NSGradient.alloc initWithStartingColor: DE_Drawing.upperShadowUpperStop endingColor: DE_Drawing.upperShadowBottomStop];
    _lowerShadow = [NSGradient.alloc initWithStartingColor: DE_Drawing.lowerShadowUpperStop endingColor: DE_Drawing.lowerShadowLowerStop];
    
    // Shadows Initialization
    _sidePanelLeftHighlight = NSShadow.alloc.init;
    [_sidePanelLeftHighlight setShadowColor: DE_Drawing.sidePanelLeftHighlightColor];
    [_sidePanelLeftHighlight setShadowOffset: NSMakeSize(2.1, 0.1)];
    [_sidePanelLeftHighlight setShadowBlurRadius: 0];
    _sidePanelRightHighlight = NSShadow.alloc.init;
    [_sidePanelRightHighlight setShadowColor: DE_Drawing.sidePanelRightHighlightColor];
    [_sidePanelRightHighlight setShadowOffset: NSMakeSize(-2.1, 0.1)];
    [_sidePanelRightHighlight setShadowBlurRadius: 0];
    _upperShadowEdge = NSShadow.alloc.init;
    [_upperShadowEdge setShadowColor: [DE_Drawing.upperShadowEdgeColor colorWithAlphaComponent: 0.25]];
    [_upperShadowEdge setShadowOffset: NSMakeSize(0.1, -3.1)];
    [_upperShadowEdge setShadowBlurRadius: 0];
    
}

#pragma mark Colors

+ (NSColor*)sidePanelFillColor { return _sidePanelFillColor; }
+ (NSColor*)sidePanelStrokeColor { return _sidePanelStrokeColor; }
+ (NSColor*)upperShadowUpperStop { return _upperShadowUpperStop; }
+ (NSColor*)upperShadowBottomStop { return _upperShadowBottomStop; }
+ (NSColor*)upperShadowEdgeColor { return _upperShadowEdgeColor; }
+ (NSColor*)lowerShadowUpperStop { return _lowerShadowUpperStop; }
+ (NSColor*)lowerShadowLowerStop { return _lowerShadowLowerStop; }
+ (NSColor*)sidePanelLeftHighlightColor { return _sidePanelLeftHighlightColor; }
+ (NSColor*)sidePanelRightHighlightColor { return _sidePanelRightHighlightColor; }
+ (NSColor*)backgroundRectColor { return _backgroundRectColor; }

#pragma mark Gradients

+ (NSGradient*)upperShadow { return _upperShadow; }
+ (NSGradient*)lowerShadow { return _lowerShadow; }

#pragma mark Shadows

+ (NSShadow*)sidePanelLeftHighlight { return _sidePanelLeftHighlight; }
+ (NSShadow*)sidePanelRightHighlight { return _sidePanelRightHighlight; }
+ (NSShadow*)upperShadowEdge { return _upperShadowEdge; }

#pragma mark Drawing Methods

+ (void)drawStylingCanvas
{
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    //// backgroundRect Drawing
    NSBezierPath* backgroundRectPath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 1, 640, 480)];
    [DE_Drawing.backgroundRectColor setFill];
    [backgroundRectPath fill];
    
    
    //// sidePanelLeft Drawing
    NSBezierPath* sidePanelLeftPath = [NSBezierPath bezierPathWithRect: NSMakeRect(-0.5, -0.5, 14, 480)];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.sidePanelLeftHighlight set];
    [DE_Drawing.sidePanelFillColor setFill];
    [sidePanelLeftPath fill];
    [NSGraphicsContext restoreGraphicsState];
    
    [DE_Drawing.sidePanelStrokeColor setStroke];
    [sidePanelLeftPath setLineWidth: 2];
    [sidePanelLeftPath stroke];
    
    
    //// sidePanelRight Drawing
    NSBezierPath* sidePanelRightPath = [NSBezierPath bezierPathWithRect: NSMakeRect(626.5, -0.5, 14, 480)];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.sidePanelRightHighlight set];
    [DE_Drawing.sidePanelFillColor setFill];
    [sidePanelRightPath fill];
    [NSGraphicsContext restoreGraphicsState];
    
    [DE_Drawing.sidePanelStrokeColor setStroke];
    [sidePanelRightPath setLineWidth: 2];
    [sidePanelRightPath stroke];
    
    
    //// upperShadowAreaRect Drawing
    NSBezierPath* upperShadowAreaRectPath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 469, 640, 10)];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.upperShadowEdge set];
    CGContextBeginTransparencyLayer(context, NULL);
    [DE_Drawing.upperShadow drawInBezierPath: upperShadowAreaRectPath angle: -90];
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    
    
    //// lowerShadowAreaRect Drawing
    NSBezierPath* lowerShadowAreaRectPath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, -1, 640, 10)];
    [DE_Drawing.lowerShadow drawInBezierPath: lowerShadowAreaRectPath angle: -90];
}

#pragma mark Generated Images

+ (NSImage*)imageOfStylingCanvas
{
    if (_imageOfStylingCanvas)
        return _imageOfStylingCanvas;
    
    _imageOfStylingCanvas = [NSImage.alloc initWithSize: NSMakeSize(640, 380)];
    [_imageOfStylingCanvas lockFocus];
    [DE_Drawing drawStylingCanvas];
    
    [_imageOfStylingCanvas unlockFocus];
    
    return _imageOfStylingCanvas;
}

@end



@implementation NSShadow (MyShadow)

- (instancetype)initWithColor: (NSColor*)color offset: (CGSize)offset blurRadius: (CGFloat)blurRadius
{
    self = super.init;
    if (self)
    {
        self.shadowColor = color;
        self.shadowOffset = offset;
        self.shadowBlurRadius = blurRadius;
    }
    return self;
}

+ (instancetype)shadowWithColor: (NSColor*)color offset: (CGSize)offset blurRadius: (CGFloat)blurRadius
{
    return [self.alloc initWithColor: color offset: offset blurRadius: blurRadius];
}


@end
