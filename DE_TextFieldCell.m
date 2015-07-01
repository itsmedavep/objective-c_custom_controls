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

- (void)highlight:(BOOL)flag withFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
//    [super drawWithFrame:cellFrame inView:controlView];

    
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxCornerRadius:2 textBoxRectangleX:1.5 textBoxRectangleY:1.5 textBoxWidth:110 textboxHeight:22 textBoxStrokeWidth:2];
    
    
//    NSRect newCellFrame = cellFrame;
    
//    if (self.highlighted) {
//        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxCornerRadius:4 textBoxRectangleX:2.5 textBoxRectangleY:2.5 textBoxWidth:96 textboxHeight:22 textBoxStrokeWidth:2];
//    } else {
//        [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxCornerRadius:4 textBoxRectangleX:2.5 textBoxRectangleY:2.5 textBoxWidth:96 textboxHeight:22 textBoxStrokeWidth:2];
//    }
    
//    [super drawWithFrame:cellFrame inView:controlView];
}

@end
