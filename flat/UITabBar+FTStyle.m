//////////////////////////////////////////////////////////////////
//
//  UITabBar+FTStyle.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UITabBar+FTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"

@implementation UITabBar (FTStyle)

//////////////////////////////////////////////////////////////////
-(void)setFlatBarColor:(UIColor*)color selected:(UIColor*)selectedColor
{
    self.backgroundImage = [UIImage imageWithColor:color size:CGSizeMake(10, 49) cornerRadius:0];
    self.selectionIndicatorImage = [UIImage imageWithColor:selectedColor size:CGSizeMake(10, 49) cornerRadius:4]; //13 6.0 3
    //[self setShadowImage:[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.5] size:CGSizeMake(0.5, 0.5) cornerRadius:0]];
    //[self setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1) cornerRadius:0]];
}
//////////////////////////////////////////////////////////////////

@end
