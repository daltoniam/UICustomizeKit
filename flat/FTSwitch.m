//////////////////////////////////////////////////////////////////
//
//  FTSwitch.m
//
//  Created by Dalton Cherry on 5/31/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "FTSwitch.h"
#import "UIColor+BaseColor.h"
#import "CircleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FTSwitch

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.on = YES;
        self.onBackgroundColor = [UIColor wetAsphaltColor];
        self.onColor = [UIColor turquoiseColor];
        self.offBackgroundColor = [UIColor colorWithRed:127/255.0f green:140/255.0f blue:141/255.0f alpha:1];
        self.offColor = [UIColor colorWithRed:189/255.0f green:195/255.0f blue:199/255.0f alpha:1];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.height/2;
}
//////////////////////////////////////////////////////////////////
-(UIView*)onViewSetup
{
    UILabel* label = (UILabel*)[super onViewSetup];
    label.textColor = [UIColor turquoiseColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.frame = CGRectMake(3, 0, 0, 0);
    return label;
}
//////////////////////////////////////////////////////////////////
-(UIView*)onBackgroundViewSetup
{
    return nil;
    //UIView* view = [super onBackgroundViewSetup];
    //view.backgroundColor = [UIColor wetAsphaltColor];
    //return view;
}
//////////////////////////////////////////////////////////////////
-(UIView*)offViewSetup
{
    UILabel* label = (UILabel*)[super offViewSetup];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.frame = CGRectMake(-3, 0, 0, 0);
    return label;
}
//////////////////////////////////////////////////////////////////
-(UIView*)offBackgroundViewSetup
{
    return nil;
    //UIView* view = [super offBackgroundViewSetup];
    //view.backgroundColor = [UIColor colorWithRed:127/255.0f green:140/255.0f blue:141/255.0f alpha:1];
    //return view;
}
//////////////////////////////////////////////////////////////////
-(UIView*)knobViewSetup
{
    CircleView* view = [CircleView circleWithColor:[UIColor turquoiseColor]];
    view.padding = 3;
    return view;
}
//////////////////////////////////////////////////////////////////
-(void)setOnColor:(UIColor *)onColor
{
    _onColor = onColor;
    if(self.isOn)
    {
        CircleView* view = (CircleView*)knobView;
        view.colors = @[onColor,onColor];
        [view setNeedsDisplay];
    }
    UILabel* label = (UILabel*)onView;
    label.textColor = onColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOffColor:(UIColor *)offColor
{
    _offColor = offColor;
    if(!self.isOn)
    {
        CircleView* view = (CircleView*)knobView;
        view.colors = @[offColor,offColor];
        [view setNeedsDisplay];
    }
    UILabel* label = (UILabel*)offView;
    label.textColor = offColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOnBackgroundColor:(UIColor *)onBackgroundColor
{
    _onBackgroundColor = onBackgroundColor;
    if(self.isOn)
        self.backgroundColor = onBackgroundColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOffBackgroundColor:(UIColor *)offBackgroundColor
{
    _offBackgroundColor = offBackgroundColor;
    if(!self.isOn)
        self.backgroundColor = offBackgroundColor;
}
//////////////////////////////////////////////////////////////////
-(void)switchStateChanged
{
    if(self.backgroundColor)
    {
        if(self.isOn)
        {
            CircleView* view = (CircleView*)knobView;
            view.colors = @[self.onColor,self.onColor];
            [view setNeedsDisplay];
            self.backgroundColor = self.onBackgroundColor;
        }
        else
        {
            CircleView* view = (CircleView*)knobView;
            view.colors = @[self.offColor,self.offColor];
            [view setNeedsDisplay];
            self.backgroundColor = self.offBackgroundColor;
        }
    }
}
//////////////////////////////////////////////////////////////////


@end
