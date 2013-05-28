//////////////////////////////////////////////////////////////////
//
//  FTProgressView.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "FTProgressView.h"
#import "UIColor+BaseColor.h"

@implementation FTProgressView

//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    //self.borderWidth = 1;
    //self.borderColor = [UIColor colorWithWhite:0.90 alpha:1];
    self.rounding = 8;
    self.corners = UIRectCornerAllCorners;
    self.backgroundColor = [UIColor clearColor];
    animateProgress = -1;
    [self setColor:[UIColor turquoiseColor]];
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
    UIColor* fillColor = [UIColor colorWithRed:235/255.0f green:237/255.0f blue:239/255.0f alpha:1];
    self.trackColors = @[fillColor,fillColor];
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.trackRange = newGradientLocations;
    
    self.colors = @[color,color];
    newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.colorRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
+(FTProgressView*)progressViewWithColor:(UIColor*)color
{
    FTProgressView* progressBar = [[FTProgressView alloc] init];
    [progressBar setColor:color];
    return progressBar;
}
//////////////////////////////////////////////////////////////////

@end
