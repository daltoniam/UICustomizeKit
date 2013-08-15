//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+FTStyle.m
//
//  Created by Dalton Cherry on 5/29/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UIBarButtonItem+BaseStyle.h"
#import "UIBarButtonItem+FTStyle.h"
#import "UIColor+BaseColor.h"
#import "UIImage+BaseImage.h"
#import "FTButton.h"

@implementation UIBarButtonItem (FTStyle)

//////////////////////////////////////////////////////////////////
-(void)setFlatColor:(UIColor*)color
{
    [UIBarButtonItem processFlatButtonColors:self color:color];
}
//////////////////////////////////////////////////////////////////
+(void)setFlatButtonColor:(UIColor*)color
{
    [self setFlatButtonColor:color whenContainedIn:[UINavigationBar class], [UINavigationController class], nil];
}
//////////////////////////////////////////////////////////////////
+(void)setFlatButtonColor:(UIColor*)color whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ...
{
    va_list vl;
    va_start(vl, containerClass);
    id appearance = [UIBarButtonItem appearanceWhenContainedIn:containerClass, nil];
    va_end(vl);
    [self processFlatButtonColors:appearance color:color];
}
//////////////////////////////////////////////////////////////////
//this is a helper method
+(void)processFlatButtonColors:(id)appearance color:(UIColor*)color
{
    FTButton* button = [FTButton buttonWithColor:color raised:NO];
    button.rounding = 2;
    button.frame = CGRectMake(0, 0, 26, 30);
    UIImage *buttonImageNormal = [button capture];
    button.highlighted = YES;
    UIImage *buttonImageHightlighted = [button capture];
    
    NSMutableDictionary *titleTextAttributes = [UIBarButtonItem titleTextAttribs:appearance forState:UIControlStateNormal];
    [titleTextAttributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:UITextAttributeTextShadowOffset];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateHighlighted];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateDisabled];
    
    [appearance setBackgroundImage:buttonImageNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [appearance setBackgroundImage:buttonImageHightlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    button = [FTButton backButtonWithColor:color raised:NO];
    button.rounding = 2;
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
    
    [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(1.0f, 1.0f) forBarMetrics:UIBarMetricsDefault];
    [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(1.0f, 1.0f) forBarMetrics:UIBarMetricsLandscapePhone];
}
//////////////////////////////////////////////////////////////////

@end
