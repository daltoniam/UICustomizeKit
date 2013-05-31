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
        self.backgroundColor = [UIColor wetAsphaltColor];
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
-(void)switchStateChanged
{
    if(self.isOn)
    {
        UIColor* backColor = [UIColor turquoiseColor];
        CircleView* view = (CircleView*)knobView;
        view.colors = @[backColor,backColor];
        [view setNeedsDisplay];
        self.backgroundColor = [UIColor wetAsphaltColor];
    }
    else
    {
        UIColor* backColor = [UIColor colorWithRed:189/255.0f green:195/255.0f blue:199/255.0f alpha:1];
        CircleView* view = (CircleView*)knobView;
        view.colors = @[backColor,backColor];
        [view setNeedsDisplay];
        self.backgroundColor = [UIColor colorWithRed:127/255.0f green:140/255.0f blue:141/255.0f alpha:1];
    }
}
//////////////////////////////////////////////////////////////////


@end
