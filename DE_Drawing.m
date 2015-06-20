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
static NSColor* _backgroundPlugColor = nil;

static NSInteger*_cornerRadius = nil;

static CGFloat*_sidePanelHeight = nil;
static CGFloat*_sidePanelWidth = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _sidePanelFillColor = [NSColor colorWithCalibratedRed: 0.332 green: 0.332 blue: 0.332 alpha: 1];
    _sidePanelStrokeColor = [NSColor colorWithCalibratedRed: 0.125 green: 0.125 blue: 0.125 alpha: 1];
    _backgroundPlugColor = [NSColor colorWithCalibratedRed: 0.24 green: 0.24 blue: 0.24 alpha: 1];
    

}

#pragma mark Colors

+ (NSColor*)sidePanelFillColor { return _sidePanelFillColor; }
+ (NSColor*)sidePanelStrokeColor { return _sidePanelStrokeColor; }
+ (NSColor*)backgroundPlugColor { return _backgroundPlugColor; }

#pragma mark Corner Radius
+ (NSInteger*)cornerRadius { return _cornerRadius; }

#pragma mark Side Panel Dims
+ (CGFloat*)sidePanelHeight { return _sidePanelHeight; }
+ (CGFloat*)sidePanelWidth { return _sidePanelWidth; }

#pragma mark Drawing Methods

+ (void)drawSidePanelWithSidePanelFrame: (NSRect)frame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight
{

    //// panelRect Drawing
    NSBezierPath* panelRectPath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(1, 1, sidePanelWidth, sidePanelHeight) xRadius: cornerRadius yRadius: cornerRadius];
    [DE_Drawing.sidePanelFillColor setFill];
    [panelRectPath fill];
    [DE_Drawing.sidePanelStrokeColor setStroke];
    [panelRectPath setLineWidth: 2];
    [panelRectPath stroke];
}

+ (void)drawBackgroundPlugWithBackgroundWidth: (CGFloat)backgroundWidth backgroundHeight: (CGFloat)backgroundHeight
{
    
    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: NSMakeRect(0, 0, backgroundWidth, backgroundHeight)];
    [DE_Drawing.backgroundPlugColor setFill];
    [rectanglePath fill];
}

#pragma mark Generated Images

+ (NSImage*)imageOfSidePanelWithSidePanelFrame: (NSRect)frame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight
{
    NSImage* imageOfSidePanel = [NSImage.alloc initWithSize: frame.size];
    [imageOfSidePanel lockFocus];
    [DE_Drawing drawSidePanelWithSidePanelFrame: frame cornerRadius: cornerRadius sidePanelWidth: sidePanelWidth sidePanelHeight: sidePanelHeight];

    [imageOfSidePanel unlockFocus];

    return imageOfSidePanel;
}

+ (NSImage*)imageOfBackgroundPlugWithBackgroundWidth: (CGFloat)backgroundWidth backgroundHeight: (CGFloat)backgroundHeight
{
    NSImage* imageOfBackgroundPlug = [NSImage.alloc initWithSize: NSMakeSize(410, 360)];
    [imageOfBackgroundPlug lockFocus];
    [DE_Drawing drawBackgroundPlugWithBackgroundWidth: backgroundWidth backgroundHeight: backgroundHeight];
    
    [imageOfBackgroundPlug unlockFocus];
    
    return imageOfBackgroundPlug;
}


@end
