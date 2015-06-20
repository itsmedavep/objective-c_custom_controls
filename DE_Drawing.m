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

static NSInteger*_cornerRadius = nil;

static CGFloat*_sidePanelHeight = nil;
static CGFloat*_sidePanelWidth = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _sidePanelFillColor = [NSColor colorWithCalibratedRed: 0.332 green: 0.332 blue: 0.332 alpha: 1];
    _sidePanelStrokeColor = [NSColor colorWithCalibratedRed: 0.125 green: 0.125 blue: 0.125 alpha: 1];
    

}

#pragma mark Colors

+ (NSColor*)sidePanelFillColor { return _sidePanelFillColor; }
+ (NSColor*)sidePanelStrokeColor { return _sidePanelStrokeColor; }

#pragma mark Corner Radius
+ (NSInteger*)cornerRadius { return _cornerRadius; }

#pragma mark Side Panel Dims
+ (CGFloat*)sidePanelHeight { return _sidePanelHeight; }
+ (CGFloat*)sidePanelWidth { return _sidePanelWidth; }

#pragma mark Drawing Methods

+ (void)drawSidePanelWithSidePanelFrame: (NSRect)sidePanelFrame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight
{

    //// panelRect Drawing
    NSBezierPath* panelRectPath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(6, 1, sidePanelWidth, sidePanelHeight) xRadius: cornerRadius yRadius: cornerRadius];
    [DE_Drawing.sidePanelFillColor setFill];
    [panelRectPath fill];
    [DE_Drawing.sidePanelStrokeColor setStroke];
    [panelRectPath setLineWidth: 2];
    [panelRectPath stroke];
}

#pragma mark Generated Images

+ (NSImage*)imageOfSidePanelWithSidePanelFrame: (NSRect)sidePanelFrame cornerRadius: (CGFloat)cornerRadius sidePanelWidth: (CGFloat)sidePanelWidth sidePanelHeight: (CGFloat)sidePanelHeight
{
    NSImage* imageOfSidePanel = [NSImage.alloc initWithSize: sidePanelFrame.size];
    [imageOfSidePanel lockFocus];
    [DE_Drawing drawSidePanelWithSidePanelFrame: sidePanelFrame cornerRadius: cornerRadius sidePanelWidth: sidePanelWidth sidePanelHeight: sidePanelHeight];

    [imageOfSidePanel unlockFocus];

    return imageOfSidePanel;
}

@end
