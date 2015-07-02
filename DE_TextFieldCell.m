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

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    [DE_Drawing drawTextBoxBackgroundCanvasWithTextBoxFrame:self.controlView.bounds textBoxCornerRadius:4 textBoxStrokeWidth:1];
    
}

@end
