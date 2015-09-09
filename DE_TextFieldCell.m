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

- (void) awakeFromNib {
    
    // Was thinking about setting up stuff when in a .xib like highlightcolor
    
}

-(NSColor *)highlightColorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    // Was thinking about drawing some custom highlight colors
    return nil;
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    // Draw textBox background
    
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:self.controlView.bounds textBoxCornerRadius:2 textBoxStrokeWidth:1];
    
    if (self.isEditable) {
        [self setBackgroundColor:[NSColor darkGrayColor]];
        [self drawInteriorWithFrame:cellFrame inView:controlView];
    }
    
    if (self.isEnabled) {
        [self setBackgroundColor:[DE_Drawing textBoxFillColor]];
    }
    
}

-(void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    NSAttributedString *attrString = self.attributedStringValue;
    
    [attrString drawWithRect: [self titleRectForBounds:cellFrame]
                     options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin];
}

- (NSRect)titleRectForBounds:(NSRect)theRect {
    NSRect titleFrame = [super titleRectForBounds:theRect];
    
    // Moving over the text origin to get it away from the edege of the frame
    titleFrame.origin.x = 4;
    
    NSAttributedString *attrString = self.attributedStringValue;
    NSRect textRect = [attrString boundingRectWithSize: titleFrame.size
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin ];
    if (textRect.size.height < titleFrame.size.height) {
        
        // Center Stuff
        titleFrame.origin.y = theRect.origin.y + (theRect.size.height - textRect.size.height) / 2.0;
        titleFrame.size.height = textRect.size.height;
    }
    return titleFrame;
}

@end
