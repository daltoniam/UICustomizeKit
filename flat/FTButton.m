//////////////////////////////////////////////////////////////////
//
//  FTButton.m
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "FTButton.h"
#import "UIColor+BaseColor.h"

@implementation FTButton

//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    self.backgroundColor = [UIColor clearColor];
    self.rounding = 4;
    //self.borderWidth = 1;
    self.corners = UIRectCornerAllCorners;
    self.titleLabel.shadowOffset = CGSizeMake(0.0, 0.1);
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
-(void)setColor:(UIColor*)color raised:(BOOL)raise
{
    self.isRaised = raise;
    UIColor* mainColor = color;
    UIColor* lineColor = mainColor;
    if(self.isRaised)
        lineColor = [mainColor adjustColor:-0.4];
    
    self.colors = @[mainColor,mainColor,lineColor];
    if(raise)
    {
        self.selectedColors = @[mainColor,mainColor,mainColor];
        self.disabledColors = @[mainColor,mainColor,mainColor];
    }
    else
    {
        UIColor* selectColor = [mainColor adjustColor:-0.1];
        self.selectedColors = @[selectColor,selectColor,selectColor];
        self.disabledColors = @[selectColor,selectColor,selectColor];
    }
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*3);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 0.92;
    newGradientLocations[2] = 1.0;
    self.colorRange = self.disabledRange = self.selectedRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
- (void)setHighlighted:(BOOL)highlighted
{
    if(highlighted != self.highlighted)
        [self flatAdjust:highlighted];
	[super setHighlighted:highlighted];
}
//////////////////////////////////////////////////////////////////
-(void)flatAdjust:(BOOL)selected
{
    if(self.isRaised)
    {
        int offset = 1;
        CGRect frame = self.frame;
        if(selected)
            frame.origin.y += offset;
        else
            frame.origin.y -= offset;
        self.frame = frame;
    }
}
//////////////////////////////////////////////////////////////////
+(FTButton*)buttonWithColor:(UIColor*)color raised:(BOOL)raise
{
    FTButton* button = [[FTButton alloc] init];
    [button setColor:color raised:raise];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.75] forState:UIControlStateDisabled];
    return button;
}
//////////////////////////////////////////////////////////////////
+(FTButton*)backButtonWithColor:(UIColor*)color raised:(BOOL)raise
{
    FTButton* button = [[FTButton alloc] init];
    button.isBackButton = YES;
    [button setColor:color raised:raise];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.75] forState:UIControlStateDisabled];
    return button;
}
//////////////////////////////////////////////////////////////////

@end
