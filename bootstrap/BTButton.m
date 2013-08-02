//////////////////////////////////////////////////////////////////
//
//  BTButton.m
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BTButton.h"
#import "UIColor+BaseColor.h"

@implementation BTButton

//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    self.backgroundColor = [UIColor clearColor];
    self.rounding = 4;
    self.borderWidth = 1;
    self.corners = UIRectCornerAllCorners;
    //self.titleLabel.shadowOffset = CGSizeMake(0.0, -0.5);
}
//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)setColor:(UIColor*)color
{
    [self cleanup];
    UIColor* mainColor = color;
    UIColor* topColor = [color adjustColor:0.12];
    UIColor* mainHigh = [color adjustColor:-0.05];
    
    UIColor* lineColor = [topColor adjustColor:0.1];
    UIColor* highLineColor = [topColor adjustColor:-0.1];

    self.colors = @[lineColor,topColor,mainColor];
    self.selectedColors = @[highLineColor,mainHigh,mainHigh];
    self.disabledColors = @[mainColor,mainColor,mainColor];
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*3);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 0.1;
    newGradientLocations[2] = 1.0;
    self.colorRange = self.disabledRange = self.selectedRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
+(BTButton*)buttonWithColor:(UIColor*)color
{
    BTButton* button = [[BTButton alloc] init];
    [button setColor:color];
    [button setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateDisabled];
    return button;
}
//////////////////////////////////////////////////////////////////
+(BTButton*)backButtonWithColor:(UIColor*)color
{
    BTButton* button = [[BTButton alloc] init];
    button.isBackButton = YES;
    [button setColor:color];
    [button setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateDisabled];
    return button;
}
//////////////////////////////////////////////////////////////////

@end
