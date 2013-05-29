//////////////////////////////////////////////////////////////////
//
//  UINavigationBar+FTStyle.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UINavigationBar+FTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"

@implementation UINavigationBar (FTStyle)

//////////////////////////////////////////////////////////////////
-(void)setFlatBarColor:(UIColor*)color
{
    [self setBackgroundImage:[UIImage imageWithColor:color size:CGSizeMake(10, 44) cornerRadius:0]
                                       forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.5] size:CGSizeMake(0.5, 0.5) cornerRadius:0]]; //still not sure about this one
}
//////////////////////////////////////////////////////////////////

@end
