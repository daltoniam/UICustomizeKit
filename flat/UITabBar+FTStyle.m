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
-(void)setFlatBarColor:(UIColor*)color
{
    self.backgroundImage = [UIImage imageWithColor:color size:CGSizeMake(10, 49) cornerRadius:0];
    self.selectionIndicatorImage = [UIImage imageWithColor:[UIColor wetAsphaltColor] size:CGSizeMake(10, 10) cornerRadius:3]; //13 6.0
}
//////////////////////////////////////////////////////////////////

@end
