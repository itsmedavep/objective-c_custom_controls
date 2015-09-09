//
//  DE_CheckBoxCell.m
//  custom_controls
//
//  Created by David Palmer on 8/13/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_CheckBoxCell.h"
#import "DE_Drawing.h"

@implementation DE_CheckBoxCell

- (void)drawImage:(NSImage *)image
        withFrame:(NSRect)frame
           inView:(NSView *)controlView {
    
    // Drawing
    if(![self isEnabled]) {
        
        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:(frame) textBoxCornerRadius:(2) textBoxStrokeWidth:(1)];
        
    } else {
        
        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:(frame) textBoxCornerRadius:(2) textBoxStrokeWidth:(1)];
    }
    // Now drawing tick
    if ([self intValue]) {
        
        if(![self isEnabled]) {
            [[NSColor redColor] setFill];
        } else {
            
            //// General Declarations
            CGContextRef context = (CGContextRef)NSGraphicsContext.currentContext.graphicsPort;
            
            //// Rectangle Drawing
            [NSGraphicsContext saveGraphicsState];
            CGContextTranslateCTM(context, frame.origin.x + 6, frame.origin.y + 10);
            CGContextRotateCTM(context, -135 * M_PI / 180);
            
            NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-3.5, -1, 7, 2) xRadius: 1 yRadius: 1];
            [DE_Drawing.sliderThumbMiddleColor setFill];
            [rectanglePath fill];
            
            [NSGraphicsContext restoreGraphicsState];
            
            //// Rectangle 2 Drawing
            [NSGraphicsContext saveGraphicsState];
            CGContextTranslateCTM(context, frame.origin.x + 11.05, frame.origin.y + 8.21);
            CGContextRotateCTM(context, 34.68 * M_PI / 180);
            
            NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(-1, -5.96, 2, 11.93) xRadius: 1 yRadius: 1];
            [DE_Drawing.sliderThumbMiddleColor setFill];
            [rectangle2Path fill];
            
            [NSGraphicsContext restoreGraphicsState];
            
        }
    }
}

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
    //    Save Graphics Context
    [NSGraphicsContext saveGraphicsState];
    
    // Draw title with whiteColor
    NSMutableAttributedString *attrString = [title mutableCopy];
    [attrString beginEditing];
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:NSMakeRange(0, [[self title] length])];
    [attrString endEditing];
    NSRect titleRect = [super drawTitle:attrString withFrame:frame inView:controlView];
    
    // Restore graphics state
    [NSGraphicsContext restoreGraphicsState];
    return titleRect;
}

//+ (Class)cellClass
//{
//    return [DE_CheckBoxCell class];
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    //    return [super initWithCoder:aDecoder];
//    if (![aDecoder isKindOfClass:[NSKeyedUnarchiver class]])
//        return [super initWithCoder:aDecoder];
//    
//    NSKeyedUnarchiver *unarchiver = (NSKeyedUnarchiver *)aDecoder;
//    
//    Class oldClass = [[self superclass] cellClass];
//    Class newClass = [[self class] cellClass];
//    
//    
//    [unarchiver setClass:newClass forClassName:NSStringFromClass(oldClass)];
//    self = [super initWithCoder:aDecoder];
//    
//    [unarchiver setClass:oldClass forClassName:NSStringFromClass(oldClass)];
//    
//    /*= set title color to white =*/
//    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
//    NSUInteger len = [attrTitle length];
//    NSRange range = NSMakeRange(0, len);
//    [attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:range];
//    [attrTitle fixAttributesInRange:range];
//    [self setAttributedTitle:attrTitle];
//    
//    return self;
//}

@end
