//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+FTStyle.m
//
//  Created by Dalton Cherry on 5/29/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

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
    button.rounding = 0;
    button.frame = CGRectMake(0, 0, 25, 30);
    UIImage *buttonImageNormal = [button capture];
    button.highlighted = YES;
    UIImage *buttonImageHightlighted = [button capture];
    
    NSMutableDictionary *titleTextAttributes = nil;
    if([appearance titleTextAttributesForState:UIControlStateNormal])
    {
        if([[appearance titleTextAttributesForState:UIControlStateNormal] isKindOfClass:[NSMutableDictionary class]])
            titleTextAttributes = (NSMutableDictionary*)[appearance titleTextAttributesForState:UIControlStateNormal];
        else
            titleTextAttributes = [[appearance titleTextAttributesForState:UIControlStateNormal] mutableCopy];
    }
    if (!titleTextAttributes)
        titleTextAttributes = [NSMutableDictionary dictionary];
    [titleTextAttributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:UITextAttributeTextShadowOffset];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateHighlighted];
    [appearance setTitleTextAttributes:titleTextAttributes forState:UIControlStateDisabled];
    
    [appearance setBackgroundImage:buttonImageNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [appearance setBackgroundImage:buttonImageHightlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    //need to do the back button as well.
}
//////////////////////////////////////////////////////////////////

@end
