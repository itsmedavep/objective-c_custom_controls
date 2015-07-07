//
//  DE_TextFieldCell.m
//  custom_controls
//
//  Created by David Palmer on 6/22/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_TextFieldCell.h"
#import "DE_Drawing.h"



@implementation DE_TextFieldCell

-(NSColor *)highlightColorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    return nil;
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:self.controlView.bounds textBoxCornerRadius:2 textBoxStrokeWidth:1];
    

//    [super drawInteriorWithFrame:cellFrame inView:controlView];
    
//    NSDictionary *attrDict = @{
//                               NSForegroundColorAttributeName : [NSColor whiteColor]
//                               };
//    
//    NSStringDrawingOptions options = 0;
//    if (self.truncatesLastVisibleLine)
//        options |= NSStringDrawingTruncatesLastVisibleLine;
//    if (!self.usesSingleLineMode)
//        options |= NSStringDrawingUsesLineFragmentOrigin;
//    
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:self.stringValue attributes: attrDict];
//    [attString drawWithRect:[self titleRectForBounds:cellFrame] options:options];
//
    if (self.isEditable) {
        [self setBackgroundColor:[NSColor darkGrayColor]];
        [self drawInteriorWithFrame:cellFrame inView:controlView];
    }
}

-(void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    NSAttributedString *attrString = self.attributedStringValue;
    
    /* if your values can be attributed strings, make them white when selected */
//    if (self.isHighlighted && self.backgroundStyle==NSBackgroundStyleDark) {
//        NSMutableAttributedString *whiteString = attrString.mutableCopy;
//        [whiteString addAttribute: NSForegroundColorAttributeName
//                            value: [NSColor redColor]
//                            range: NSMakeRange(0, whiteString.length) ];
//        attrString = whiteString;
//    }
    
    [attrString drawWithRect: [self titleRectForBounds:cellFrame]
                     options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin];
}

- (NSRect)titleRectForBounds:(NSRect)theRect {
    /* get the standard text content rectangle */
    NSRect titleFrame = [super titleRectForBounds:theRect];
    
    /* find out how big the rendered text will be */
    NSAttributedString *attrString = self.attributedStringValue;
    NSRect textRect = [attrString boundingRectWithSize: titleFrame.size
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin ];
    
    /* If the height of the rendered text is less then the available height,
     * we modify the titleRect to center the text vertically */
    if (textRect.size.height < titleFrame.size.height) {
        titleFrame.origin.y = theRect.origin.y + (theRect.size.height - textRect.size.height) / 2.0;
        titleFrame.size.height = textRect.size.height;
    }
    return titleFrame;
}

@end
