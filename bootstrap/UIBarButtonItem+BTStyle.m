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
    UIColor *newColor = [color adjustColor:-0.12];
    BTButton* button = [BTButton buttonWithColor:newColor];
    button.frame = CGRectMake(0, 0, 26, 30);
    UIImage *buttonImageNormal = [button capture];
    button.highlighted = YES;
    UIImage *buttonImageHightlighted = [button capture];
    
    [appearance setBackgroundImage:buttonImageNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [appearance setBackgroundImage:buttonImageHightlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    button = [BTButton backButtonWithColor:newColor];
    button.frame = CGRectMake(0, 0, 30, 30);
    UIImage *backButtonPortraitImage = [button capture];
    button.highlighted = YES;
    UIImage *highlightedBackButtonPortraitImage = [button capture];
    
    button.frame = CGRectMake(0, 0, 40, 22);
    UIImage *backButtonLandscapeImage = [button capture];
    button.highlighted = YES;
    UIImage *highlightedBackButtonLandscapeImage = [button capture];
    
    [appearance setBackButtonBackgroundImage:backButtonPortraitImage
                                    forState:UIControlStateNormal
                                  barMetrics:UIBarMetricsDefault];
    
    [appearance setBackButtonBackgroundImage:backButtonLandscapeImage
                                    forState:UIControlStateNormal
                                  barMetrics:UIBarMetricsLandscapePhone];
    [appearance setBackButtonBackgroundImage:highlightedBackButtonPortraitImage
                                    forState:UIControlStateHighlighted
                                  barMetrics:UIBarMetricsDefault];
    [appearance setBackButtonBackgroundImage:highlightedBackButtonLandscapeImage
                                    forState:UIControlStateHighlighted
                                  barMetrics:UIBarMetricsLandscapePhone];
}
//////////////////////////////////////////////////////////////////

@end
