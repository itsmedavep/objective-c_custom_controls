//
//  DE_CheckBox.m
//  custom_controls
//
//  Created by David Palmer on 8/30/15.
//  Copyright (c) 2015 discode enterprises. All rights reserved.
//

#import "DE_CheckBox.h"
#import "DE_CheckBoxCell.h"

@implementation DE_CheckBox

+ (Class)cellClass
{
    return [DE_CheckBoxCell class];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
//    return [super initWithCoder:aDecoder];
    if (![aDecoder isKindOfClass:[NSKeyedUnarchiver class]])
        return [super initWithCoder:aDecoder];
    
    NSKeyedUnarchiver *unarchiver = (NSKeyedUnarchiver *)aDecoder;
    
    Class oldClass = [[self superclass] cellClass];
    Class newClass = [[self class] cellClass];
    
    
    [unarchiver setClass:newClass forClassName:NSStringFromClass(oldClass)];
    self = [super initWithCoder:aDecoder];
    
    [unarchiver setClass:oldClass forClassName:NSStringFromClass(oldClass)];
    
    /*= set title color to white =*/
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:range];
    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
    
    return self;
}

@end
