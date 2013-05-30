//////////////////////////////////////////////////////////////////
//
//  UITabBar+BTStyle.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UITabBar+BTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"

@implementation UITabBar (BTStyle)

//////////////////////////////////////////////////////////////////
-(void)setBTBarColor:(UIColor*)color
{
    CGFloat ranges[] = {0,1};
    self.backgroundImage = [UIImage imageWithColors:[NSArray arrayWithObjects:color,[color adjustColor:-0.12], nil] ranges:ranges size:CGSizeMake(10, 49) cornerRadius:0];
    int size = self.frame.size.width/self.items.count;
    self.selectionIndicatorImage = [UIImage imageWithColors:[NSArray arrayWithObjects:[color adjustColor:-0.12],color, nil] ranges:ranges size:CGSizeMake(size, 49) ];
}
//////////////////////////////////////////////////////////////////

@end
