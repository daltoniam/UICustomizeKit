//////////////////////////////////////////////////////////////////
//
//  BTProgressView.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BTProgressView.h"
#import "UIColor+BaseColor.h"

@implementation BTProgressView

//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    self.borderWidth = 1;
    self.borderColor = [UIColor colorWithWhite:0.90 alpha:1];
    self.rounding = 4;
    self.corners = UIRectCornerAllCorners;
    self.backgroundColor = [UIColor clearColor];
    animateProgress = -1;
    [self setColor:[UIColor primaryColor]];
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
    UIColor* fillColor = [UIColor colorWithWhite:0.97 alpha:1];
    self.trackColors = @[[UIColor colorWithWhite:0.92 alpha:1],fillColor,fillColor];
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*3);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 0.12;
    newGradientLocations[2] = 1.0;
    self.trackRange = newGradientLocations;
    
    self.colors = @[color,[color adjustColor:-0.12]];
    
    newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.colorRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
+(BTProgressView*)progressViewWithColor:(UIColor*)color
{
    BTProgressView* progressBar = [[BTProgressView alloc] init];
    [progressBar setColor:color];
    return progressBar;
}
//////////////////////////////////////////////////////////////////

@end
