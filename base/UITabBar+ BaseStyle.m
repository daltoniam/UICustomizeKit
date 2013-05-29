//////////////////////////////////////////////////////////////////
//
//  UITabBar+BaseStyle.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UITabBar+BaseStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"

@implementation UITabBar (BaseStyle)

//////////////////////////////////////////////////////////////////
-(void)setImageColor:(UIColor*)color selected:(UIColor*)selectedColor
{
    for(UITabBarItem* item in self.items)
    {
        UIImage* img = [item.image imageWithOverlayColor:color];
        UIImage* selImg = [item.image imageWithOverlayColor:selectedColor];
        [item setFinishedSelectedImage:img withFinishedUnselectedImage:selImg];
    }
}
//////////////////////////////////////////////////////////////////
-(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor
{
    for(UITabBarItem* item in self.items)
    {
        NSMutableDictionary* attribs = [UITabBar titleTextAttribs:item forState:UIControlStateNormal];
        [attribs setValue:color forKey:UITextAttributeTextColor];
        [item setTitleTextAttributes:attribs forState:UIControlStateNormal];
        
        attribs = [UITabBar titleTextAttribs:item forState:UIControlStateHighlighted];
        [attribs setValue:selectedColor forKey:UITextAttributeTextColor];
        [item setTitleTextAttributes:attribs forState:UIControlStateHighlighted];
    }
}
//////////////////////////////////////////////////////////////////
-(void)setFont:(UIFont*)font
{
    for(UITabBarItem* item in self.items)
    {
        NSMutableDictionary* attribs = [UITabBar titleTextAttribs:item forState:UIControlStateNormal];
        [attribs setValue:font forKey:UITextAttributeFont];
        [item setTitleTextAttributes:attribs forState:UIControlStateNormal];
        
        attribs = [UITabBar titleTextAttribs:item forState:UIControlStateHighlighted];
        [attribs setValue:font forKey:UITextAttributeFont];
        [item setTitleTextAttributes:attribs forState:UIControlStateHighlighted];
    }
}
//////////////////////////////////////////////////////////////////
+(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor
{
    id appearance = [UITabBarItem appearance];
    NSMutableDictionary* attribs = [UITabBar titleTextAttribs:appearance forState:UIControlStateNormal];
    [attribs setValue:color forKey:UITextAttributeTextColor];
    [appearance setTitleTextAttributes:attribs forState:UIControlStateNormal];
    
    attribs = [UITabBar titleTextAttribs:appearance forState:UIControlStateHighlighted];
    [attribs setValue:selectedColor forKey:UITextAttributeTextColor];
    [appearance setTitleTextAttributes:attribs forState:UIControlStateHighlighted];
}
//////////////////////////////////////////////////////////////////
+(void)setFont:(UIFont*)font
{
    id appearance = [UITabBarItem appearance];
    NSMutableDictionary* attribs = [UITabBar titleTextAttribs:appearance forState:UIControlStateNormal];
    [attribs setValue:font forKey:UITextAttributeFont];
    [appearance setTitleTextAttributes:attribs forState:UIControlStateNormal];
    
    attribs = [UITabBar titleTextAttribs:appearance forState:UIControlStateHighlighted];
    [attribs setValue:font forKey:UITextAttributeFont];
    [appearance setTitleTextAttributes:attribs forState:UIControlStateHighlighted];
}
//////////////////////////////////////////////////////////////////
+(NSMutableDictionary*)titleTextAttribs:(id)appearance forState:(UIControlState)state
{
    NSMutableDictionary *titleTextAttributes = nil;
    if([appearance titleTextAttributesForState:state])
    {
        if([[appearance titleTextAttributesForState:UIControlStateNormal] isKindOfClass:[NSMutableDictionary class]])
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
