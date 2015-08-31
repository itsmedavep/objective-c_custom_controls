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

static NSColor* _textBoxOuterShadowColor = nil;
static NSColor* _textBoxFillColor = nil;
static NSColor* _textBoxStrokeColor = nil;
static NSColor* _textBoxShadowColor = nil;

static NSColor* _sliderThumbMiddleColor = nil;

static NSGradient* _upperShadow = nil;
static NSGradient* _lowerShadow = nil;

static NSShadow* _sidePanelLeftHighlight = nil;
static NSShadow* _sidePanelRightHighlight = nil;

static NSShadow* _upperShadowEdge = nil;

static NSShadow* _textBoxEdgeHighligh = nil;
static NSShadow* _textBoxInnerShadow = nil;

static NSImage* _imageOfStylingCanvas = nil;
static NSImage* _imageOfTextBoxBackgroundCanvasWithTextBoxCornerRadius = nil;

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
    
    _backgroundRectColor = [NSColor colorWithCalibratedRed: 0.314 green: 0.314 blue: 0.314 alpha: 1];
    
    _textBoxOuterShadowColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    _textBoxFillColor = [NSColor colorWithCalibratedRed: 0.2 green: 0.2 blue: 0.2 alpha: 1];
//    _textBoxFillColor = [NSColor redColor];
    _textBoxStrokeColor = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    _textBoxShadowColor = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 1];
    
    _sliderThumbMiddleColor = [NSColor colorWithCalibratedRed: 1 green: 0.478 blue: 0 alpha: 1];
    
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
    
    _textBoxEdgeHighligh = NSShadow.alloc.init;
    [_textBoxEdgeHighligh setShadowColor: [DE_Drawing.textBoxOuterShadowColor colorWithAlphaComponent: 0.40]];
    [_textBoxEdgeHighligh setShadowOffset: NSMakeSize(0.1, -1.1)];
    [_textBoxEdgeHighligh setShadowBlurRadius: 2];
    
    _textBoxInnerShadow = NSShadow.alloc.init;
    [_textBoxInnerShadow setShadowColor: [DE_Drawing.textBoxShadowColor colorWithAlphaComponent: 0.2]];
    [_textBoxInnerShadow setShadowOffset: NSMakeSize(0.1, -1.1)];
    [_textBoxInnerShadow setShadowBlurRadius: 5];
    
    
    
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

+ (NSColor*)textBoxOuterShadowColor { return _textBoxOuterShadowColor; }
+ (NSColor*)textBoxFillColor { return _textBoxFillColor; }
+ (NSColor*)textBoxStrokeColor { return _textBoxStrokeColor; }
+ (NSColor*)textBoxShadowColor { return _textBoxShadowColor; }

+ (NSColor*)sliderThumbMiddleColor { return _sliderThumbMiddleColor; }

#pragma mark Gradients

+ (NSGradient*)upperShadow { return _upperShadow; }
+ (NSGradient*)lowerShadow { return _lowerShadow; }

#pragma mark Shadows

+ (NSShadow*)sidePanelLeftHighlight { return _sidePanelLeftHighlight; }
+ (NSShadow*)sidePanelRightHighlight { return _sidePanelRightHighlight; }

+ (NSShadow*)upperShadowEdge { return _upperShadowEdge; }
+ (NSShadow*)textBoxEdgeHighligh { return _textBoxEdgeHighligh; }
+ (NSShadow*)textBoxInnerShadow { return _textBoxInnerShadow; }

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

+ (void)drawTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth
{
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    //// textBoxRectangle Drawing
    NSBezierPath* textBoxRectanglePath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(NSMinX(textBoxFrame) + .5, NSMinY(textBoxFrame) + .5, NSWidth(textBoxFrame) - 1, NSHeight(textBoxFrame) - 2) xRadius: textBoxCornerRadius yRadius: textBoxCornerRadius];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.textBoxEdgeHighligh set];
    [DE_Drawing.textBoxFillColor setFill];
    [textBoxRectanglePath fill];
    
    ////// textBoxRectangle Inner Shadow
    [NSGraphicsContext saveGraphicsState];
    NSRectClip(textBoxRectanglePath.bounds);
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
        [textBoxRectanglePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
    
    [NSGraphicsContext restoreGraphicsState];
    
    [DE_Drawing.textBoxStrokeColor setStroke];
    [textBoxRectanglePath setLineWidth: textBoxStrokeWidth];
    [textBoxRectanglePath stroke];
    
}

+ (void)drawSliderThumbWithFrame: (NSRect)frame {
    
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    NSColor* sliderTrackStrokeColor = [NSColor colorWithCalibratedRed: 0.208 green: 0.208 blue: 0.208 alpha: 1];
    NSColor* sliderThumbGradientColor = [NSColor colorWithCalibratedRed: 0.216 green: 0.216 blue: 0.216 alpha: 1];
    NSColor* sliderThumbGradientColor2 = [NSColor colorWithCalibratedRed: 0.286 green: 0.286 blue: 0.286 alpha: 1];
    
    //// Gradient Declarations
    NSGradient* sliderThumbGradient = [NSGradient.alloc initWithStartingColor: sliderThumbGradientColor2 endingColor: sliderThumbGradientColor];
    
    //// Shadow Declarations
    NSShadow* sliderThumbDropShadow = NSShadow.alloc.init;
    [sliderThumbDropShadow setShadowColor: [NSColor.blackColor colorWithAlphaComponent: 0.5]];
    [sliderThumbDropShadow setShadowOffset: NSMakeSize(0.1, -4.1)];
    [sliderThumbDropShadow setShadowBlurRadius: 5];
    
    //// sliderThumbGroup
    {
        //// sliderThumb Drawing
        NSBezierPath* sliderThumbPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(NSMinX(frame) + 2, NSMinY(frame) + NSHeight(frame) - 19, 16, 16)];
        [NSGraphicsContext saveGraphicsState];
        [sliderThumbDropShadow set];
        CGContextBeginTransparencyLayer(context, NULL);
        [sliderThumbGradient drawInBezierPath: sliderThumbPath angle: -90];
        CGContextEndTransparencyLayer(context);
        
        ////// sliderThumb Inner Shadow
        [NSGraphicsContext saveGraphicsState];
//        NSRectClip(sliderThumbPath.bounds);
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
            [sliderThumbPath fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        [NSGraphicsContext restoreGraphicsState];
        
        [sliderTrackStrokeColor setStroke];
        [sliderThumbPath setLineWidth: 1];
        [sliderThumbPath stroke];
        
        
        //// sliderThumbMiddle Drawing
        NSBezierPath* sliderThumbMiddlePath = [NSBezierPath bezierPathWithRect: NSMakeRect(NSMinX(frame) + 9.5, NSMinY(frame) + NSHeight(frame) - 15, 1, 8)];
        [NSGraphicsContext saveGraphicsState];
        [sliderThumbDropShadow set];
        [DE_Drawing.sliderThumbMiddleColor setFill];
        [sliderThumbMiddlePath fill];
        
        ////// sliderThumbMiddle Inner Shadow
        [NSGraphicsContext saveGraphicsState];
//        NSRectClip(sliderThumbMiddlePath.bounds);
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
            [sliderThumbMiddlePath fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        [NSGraphicsContext restoreGraphicsState];
        
    }
}

+ (void)drawSliderWithFrame: (NSRect)frame sliderTrackCornerRadius: (CGFloat)sliderTrackCornerRadius
{
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    //// Color Declarations
    NSColor* sliderTrackBackgroundColor = [NSColor colorWithCalibratedRed: 0.29 green: 0.29 blue: 0.29 alpha: 1];
    NSColor* sliderTrackStrokeColor = [NSColor colorWithCalibratedRed: 0.208 green: 0.208 blue: 0.208 alpha: 1];
    
    //// sliderBackground Drawing
    NSBezierPath* sliderBackgroundPath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(NSMinX(frame) - 6.5, NSMinY(frame) + 6.5, NSWidth(frame) + 12, NSHeight(frame) - 8) xRadius: sliderTrackCornerRadius yRadius: sliderTrackCornerRadius];
    [NSGraphicsContext saveGraphicsState];
    [DE_Drawing.textBoxEdgeHighligh set];
    [sliderTrackBackgroundColor setFill];
    [sliderBackgroundPath fill];
    [NSGraphicsContext restoreGraphicsState];
    
    [sliderTrackStrokeColor setStroke];
    [sliderBackgroundPath setLineWidth: 1];
    [sliderBackgroundPath stroke];
    
    
    //// sliderBackgroundFilled Drawing
    NSBezierPath* sliderBackgroundFilledPath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(NSMinX(frame) - 6, NSMinY(frame) + NSHeight(frame) - 14, 155, 12) xRadius: 6 yRadius: 6];
    [DE_Drawing.sliderThumbMiddleColor setFill];
    [sliderBackgroundFilledPath fill];
    
    ////// sliderBackgroundFilled Inner Shadow
    [NSGraphicsContext saveGraphicsState];
    NSRectClip(sliderBackgroundFilledPath.bounds);
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
        [sliderBackgroundFilledPath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    [NSGraphicsContext restoreGraphicsState];
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

+ (NSImage*)imageOfTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth
{
    NSImage* imageOfTextBoxBackgroundCanvas = [NSImage.alloc initWithSize: textBoxFrame.size];
    [imageOfTextBoxBackgroundCanvas lockFocus];
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame: textBoxFrame textBoxCornerRadius: textBoxCornerRadius textBoxStrokeWidth: textBoxStrokeWidth];
    
    [imageOfTextBoxBackgroundCanvas unlockFocus];
    
    return imageOfTextBoxBackgroundCanvas;
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
