//
//  DE_Sidebar.m
//  custom_controls
//
//  Created by David Palmer on 6/17/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_Sidebar.h"
#import "DE_Drawing.h"

@implementation DE_Sidebar

- (void)drawRect:(NSRect)frame {
    
    [DE_Drawing drawSidePanelWithSidePanelFrame:frame cornerRadius:0 sidePanelWidth:frame.size.width+10 sidePanelHeight:frame.size.height];
    
    // Drawing code here.
}

@end
