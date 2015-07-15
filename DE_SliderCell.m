//
//  DE_SliderCell.m
//  custom_controls
//
//  Created by David Palmer on 7/12/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_SliderCell.h"
#import "DE_Drawing.h"

@implementation DE_SliderCell

- (void)drawKnob:(NSRect)frame {
    
    [DE_Drawing drawSliderThumbWithFrame:frame];
}

//-(void)drawBarInside:(NSRect)aRect flipped:(BOOL)flipped {
//    
//}

@end
