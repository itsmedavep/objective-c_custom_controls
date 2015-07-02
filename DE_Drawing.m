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
static NSColor* _textBoxFieldLabelColor = nil;

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
    _textBoxFillColor = [NSColor colorWithCalibratedRed: 0.29 green: 0.29 blue: 0.29 alpha: 1];
//    _textBoxFillColor = [NSColor redColor];
    _textBoxStrokeColor = [NSColor colorWithCalibratedRed: 0.208 green: 0.208 blue: 0.208 alpha: 1];
    _textBoxFieldLabelColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    
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
    [_textBoxEdgeHighligh setShadowColor: [DE_Drawing.textBoxOuterShadowColor colorWithAlphaComponent: 0.75]];
    [_textBoxEdgeHighligh setShadowOffset: NSMakeSize(0.1, -1.1)];
    [_textBoxEdgeHighligh setShadowBlurRadius: 2];
    
    _textBoxInnerShadow = NSShadow.alloc.init;
    [_textBoxInnerShadow setShadowColor: NSColor.blackColor];
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
+ (NSColor*)textBoxFieldLabelColor { return _textBoxFieldLabelColor; }

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

+ (void)drawTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth textFieldBoxLabel: (NSString*)textFieldBoxLabel textBoxLabelSize: (CGFloat)textBoxLabelSize
{
    //// General Declarations
    CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
    
    //// textBoxRectangle Drawing
    NSRect textBoxRectangleRect = NSMakeRect(NSMinX(textBoxFrame) + 3.5, NSMinY(textBoxFrame) + 4.5, NSWidth(textBoxFrame) - 4, NSHeight(textBoxFrame) - 6);
    NSBezierPath* textBoxRectanglePath = [NSBezierPath bezierPathWithRoundedRect: textBoxRectangleRect xRadius: textBoxCornerRadius yRadius: textBoxCornerRadius];
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
        opaqueShadow.shadowColor = [DE_Drawing.textBoxInnerShadow.shadowColor colorWithAlphaComponent: 0];
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
    NSMutableParagraphStyle* textBoxRectangleStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textBoxRectangleStyle.alignment = NSLeftTextAlignment;
    
    NSDictionary* textBoxRectangleFontAttributes = @{NSFontAttributeName: [NSFont fontWithName: @"Helvetica" size: textBoxLabelSize], NSForegroundColorAttributeName: DE_Drawing.textBoxFieldLabelColor, NSParagraphStyleAttributeName: textBoxRectangleStyle};
    
    NSRect textBoxRectangleInset = NSInsetRect(textBoxRectangleRect, 5, 0);
    CGFloat textBoxRectangleTextHeight = NSHeight([textFieldBoxLabel boundingRectWithSize: textBoxRectangleInset.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textBoxRectangleFontAttributes]);
    NSRect textBoxRectangleTextRect = NSMakeRect(NSMinX(textBoxRectangleInset), NSMinY(textBoxRectangleInset) + (NSHeight(textBoxRectangleInset) - textBoxRectangleTextHeight) / 2, NSWidth(textBoxRectangleInset), textBoxRectangleTextHeight);
    [NSGraphicsContext saveGraphicsState];
    NSRectClip(textBoxRectangleInset);
    [textFieldBoxLabel drawInRect: NSOffsetRect(textBoxRectangleTextRect, 0, 1) withAttributes: textBoxRectangleFontAttributes];
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

+ (NSImage*)imageOfTextBoxBackgroundCanvasWithTextBoxFrame: (NSRect)textBoxFrame textBoxCornerRadius: (CGFloat)textBoxCornerRadius textBoxStrokeWidth: (CGFloat)textBoxStrokeWidth textFieldBoxLabel: (NSString*)textFieldBoxLabel textBoxLabelSize: (CGFloat)textBoxLabelSize
{
    NSImage* imageOfTextBoxBackgroundCanvas = [NSImage.alloc initWithSize: textBoxFrame.size];
    [imageOfTextBoxBackgroundCanvas lockFocus];
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame: textBoxFrame textBoxCornerRadius: textBoxCornerRadius textBoxStrokeWidth: textBoxStrokeWidth textFieldBoxLabel: textFieldBoxLabel textBoxLabelSize: textBoxLabelSize];
    
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
