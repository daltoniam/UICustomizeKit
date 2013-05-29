//////////////////////////////////////////////////////////////////
//
//  UINavigationBar+BTStyle.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UINavigationBar+BTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"

@implementation UINavigationBar (BTStyle)

//////////////////////////////////////////////////////////////////
-(void)setBTBarColor:(UIColor*)color
{
    CGFloat ranges[] = {0,1};
    [self setBackgroundImage:[UIImage imageWithColors:[NSArray arrayWithObjects:color,[color adjustColor:-0.12], nil]
                                                                       ranges:ranges size:CGSizeMake(10, 44) cornerRadius:0]
                                       forBarMetrics:UIBarMetricsDefault];
}
//////////////////////////////////////////////////////////////////

@end
