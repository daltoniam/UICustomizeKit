//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+BaseStyle.m
//
//  Created by Dalton Cherry on 6/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UIBarButtonItem+BaseStyle.h"

@implementation UIBarButtonItem (BaseStyle)


//////////////////////////////////////////////////////////////////
-(void)setFont:(UIFont*)font
{
    [UIBarButtonItem processFont:self font:font];
}
//////////////////////////////////////////////////////////////////
+(void)setFont:(UIFont*)font
{
    [self setFont:font whenContainedIn:[UINavigationBar class], [UINavigationController class], nil];
}
//////////////////////////////////////////////////////////////////
+(void)setFont:(UIFont*)font whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ...
{
    va_list vl;
    va_start(vl, containerClass);
    id appearance = [UIBarButtonItem appearanceWhenContainedIn:containerClass, nil];
    va_end(vl);
    [self processFont:appearance font:font];
}
//////////////////////////////////////////////////////////////////
+(void)processFont:(id)appearance font:(UIFont*)font
{
    NSMutableDictionary *titleTextAttributes = [UIBarButtonItem titleTextAttribs:appearance forState:UIControlStateNormal];
    [titleTextAttributes setObject:font forKey:NSFontAttributeName];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateHighlighted];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateDisabled];
}
//////////////////////////////////////////////////////////////////
+(NSMutableDictionary*)titleTextAttribs:(id)appearance forState:(UIControlState)state
{
    NSMutableDictionary *titleTextAttributes = nil;
    if([appearance titleTextAttributesForState:state])
    {
        if([[appearance titleTextAttributesForState:state] isKindOfClass:[NSMutableDictionary class]])
            titleTextAttributes = (NSMutableDictionary*)[appearance titleTextAttributesForState:state];
        else
            titleTextAttributes = [[appearance titleTextAttributesForState:state] mutableCopy];
    }
    if (!titleTextAttributes)
        titleTextAttributes = [NSMutableDictionary dictionary];
    return titleTextAttributes;
}
//////////////////////////////////////////////////////////////////

@end
