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
    
    NSDictionary *attrDict = @{
//                               NSFontAttributeName : [UIFont fontWithName:Arial size:16.0],
                               NSForegroundColorAttributeName : [NSColor whiteColor]
                               };
    
    NSStringDrawingOptions options = 0;
    if (self.truncatesLastVisibleLine)
        options |= NSStringDrawingTruncatesLastVisibleLine;
    if (!self.usesSingleLineMode)
        options |= NSStringDrawingUsesLineFragmentOrigin;
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:self.stringValue attributes: attrDict];
    [attString drawWithRect:[self titleRectForBounds:cellFrame] options:options];
}

@end
