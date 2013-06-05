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
-(void)setFlatBarColor:(UIColor*)color // selected:(UIColor*)selectedColor
{
    self.backgroundImage = [UIImage imageWithColor:color size:CGSizeMake(10, 49) cornerRadius:0];
    //[self setShadowImage:[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.5] size:CGSizeMake(0.5, 0.5) cornerRadius:0]];
    //[self setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1) cornerRadius:0]];
}
//////////////////////////////////////////////////////////////////
-(void)setFlatBarSelectedColor:(UIColor*)color
{
    //self.selectionIndicatorImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1) cornerRadius:0];
    int size = self.frame.size.width/self.items.count;
    self.selectionIndicatorImage = [UIImage imageWithColor:color size:CGSizeMake(size, 49)]; //4
    /*int width = size;
    int left = width;
    for(int i = 0; i < self.items.count; i++)
    {
        UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(left, 0, 0.5, 49)];
        lineView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
        [self addSubview:lineView];
        left += width;
    }*/
}
//////////////////////////////////////////////////////////////////

@end
