//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+BTStyle.m
//
//  Created by Dalton Cherry on 5/29/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UIBarButtonItem+BTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"
#import "BTButton.h"

@implementation UIBarButtonItem (BTStyle)

//////////////////////////////////////////////////////////////////
-(void)setBTColor:(UIColor*)color
{
    [UIBarButtonItem processButtonColors:self color:color];
}
//////////////////////////////////////////////////////////////////
+(void)setBTButtonColors:(UIColor*)color
{
    [self setBTButtonColors:color whenContainedIn:[UINavigationBar class], [UINavigationController class], nil];
}
//////////////////////////////////////////////////////////////////
+(void)setBTButtonColors:(UIColor*)color whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ...
{
    va_list vl;
    va_start(vl, containerClass);
    id appearance = [UIBarButtonItem appearanceWhenContainedIn:containerClass, nil];
    va_end(vl);
    [self processButtonColors:appearance color:color];
}
//////////////////////////////////////////////////////////////////
//this is a helper method
+(void)processButtonColors:(id)appearance color:(UIColor*)color
{
    BTButton* button = [BTButton buttonWithColor:[color adjustColor:-0.12]];
    button.frame = CGRectMake(0, 0, 25, 30);
    UIImage *buttonImageNormal = [button capture];
    button.highlighted = YES;
    UIImage *buttonImageHightlighted = [button capture];
    
    [appearance setBackgroundImage:buttonImageNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [appearance setBackgroundImage:buttonImageHightlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}
//////////////////////////////////////////////////////////////////

@end
