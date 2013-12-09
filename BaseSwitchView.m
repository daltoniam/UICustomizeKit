//////////////////////////////////////////////////////////////////
//
//  BaseSwitchView.m
//
//  Created by Dalton Cherry on 5/31/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseSwitchView.h"
#import "CircleView.h"
#import "UIColor+BaseColor.h"

@implementation BaseSwitchView

@synthesize on,onText,offText;
//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    if(frame.size.width == 0 || frame.size.height == 0)
    {
        if(self.frame.size.width == 0)
            frame.size.width = 79;
        if(self.frame.size.height == 0)
            frame.size.height = 27;
    }
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        
        UITapGestureRecognizer* onTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnOn)];
        UITapGestureRecognizer* offTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnOff)];
        
        onBackgroundView = [self onBackgroundViewSetup];
        onBackgroundView.userInteractionEnabled = YES;
        [onBackgroundView addGestureRecognizer:offTap];
        [scrollView addSubview:onBackgroundView];
        
        offBackgroundView = [self offBackgroundViewSetup];
        offBackgroundView.userInteractionEnabled = YES;
        [offBackgroundView addGestureRecognizer:onTap];
        [scrollView addSubview:offBackgroundView];
        
        onView = [self onViewSetup];
        onView.userInteractionEnabled = YES;
        [onView addGestureRecognizer:offTap];
        [scrollView addSubview:onView];
        
        offView = [self offViewSetup];
        offView.userInteractionEnabled = YES;
        [offView addGestureRecognizer:onTap];
        [scrollView addSubview:offView];
        
        knobView = [self knobViewSetup];
        [scrollView addSubview:knobView];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)layoutSubviews
{
    [super layoutSubviews];
    scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    float size = scrollView.frame.size.height;
    scrollView.contentSize = CGSizeMake((scrollView.frame.size.width*2)-size, scrollView.frame.size.height);
    knobView.frame = CGRectMake(scrollView.frame.size.width-size, 0, size, size);
    
    float left = knobView.frame.size.width + knobView.frame.origin.x;
    onView.frame = CGRectMake(onView.frame.origin.x, 0, scrollView.frame.size.width-size, size);
    offView.frame = CGRectMake(left+offView.frame.origin.x, 0, scrollView.frame.size.width-size, size);
    
    onBackgroundView.frame = CGRectMake(0, 0, scrollView.frame.size.width-(size/2), scrollView.frame.size.height);
    left = onBackgroundView.frame.size.width;
    offBackgroundView.frame = CGRectMake(left, 0, scrollView.frame.size.width-(size/2), scrollView.frame.size.height);
    
    CGPoint point = CGPointMake(scrollView.frame.size.width-scrollView.frame.size.height, 0);
    if(self.isOn)
        point = CGPointMake(0, 0);
    [scrollView setContentOffset:point animated:NO];
}
//////////////////////////////////////////////////////////////////
- (void)scrollViewDidScroll:(UIScrollView *)view
{
    [view setContentOffset:CGPointMake(view.contentOffset.x, 0)];
}
//////////////////////////////////////////////////////////////////
-(UIView*)onViewSetup
{
    UILabel* label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"ON",nil);
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = self.onColor;
    return label;
}
//////////////////////////////////////////////////////////////////
-(UIView*)onBackgroundViewSetup
{
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = self.onBackgroundColor;
    return view;
}
//////////////////////////////////////////////////////////////////
-(UIView*)offViewSetup
{
    UILabel* label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"OFF",nil);
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = self.offColor;
    return label;
}
//////////////////////////////////////////////////////////////////
-(UIView*)offBackgroundViewSetup
{
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = [UIColor alizarinColor];
    return view;
}
//////////////////////////////////////////////////////////////////
-(UIView*)knobViewSetup
{
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = self.backgroundColor;
    return view;
}
//////////////////////////////////////////////////////////////////
-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    knobView.backgroundColor = backgroundColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOnBackgroundColor:(UIColor *)onBackgroundColor
{
    _onBackgroundColor = onBackgroundColor;
    onBackgroundView.backgroundColor = _onBackgroundColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOffBackgroundColor:(UIColor *)offBackgroundColor
{
    _offBackgroundColor = offBackgroundColor;
    offBackgroundView.backgroundColor = offBackgroundColor;
}
//////////////////////////////////////////////////////////////////
-(void)setOnColor:(UIColor *)onColor
{
    _onColor = onColor;
    if([offView isKindOfClass:[UILabel class]])
        [(UILabel*)offView setTextColor:onColor];
}
//////////////////////////////////////////////////////////////////
-(void)setOffColor:(UIColor *)offColor
{
    _offColor = offColor;
    if([onView isKindOfClass:[UILabel class]])
        [(UILabel*)onView setTextColor:offColor];
}
//////////////////////////////////////////////////////////////////
-(void)setOnText:(NSString *)text
{
    onText = text;
    if([onView respondsToSelector:@selector(setText:)])
        [onView performSelector:@selector(setText:) withObject:text];
}
//////////////////////////////////////////////////////////////////
-(void)setOffText:(NSString *)text
{
    offText = text;
    if([offView respondsToSelector:@selector(setText:)])
        [offView performSelector:@selector(setText:) withObject:text];
}
//////////////////////////////////////////////////////////////////
- (void)setOn:(BOOL)state animated:(BOOL)animated
{
    CGPoint point = CGPointMake(scrollView.frame.size.width-scrollView.frame.size.height, 0);
    if(state)
        point = CGPointMake(0, 0);
    [scrollView setContentOffset:point animated:animated];
    on = state; // accessed directly so property is readonly.
    [self switchStateChanged];
}
//////////////////////////////////////////////////////////////////
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll
{
    if(!didTap)
    {
        if(scroll.contentOffset.x != 0)
            [self setOn:NO animated:NO];
        else
            [self setOn:YES animated:NO];
    }
}
//////////////////////////////////////////////////////////////////
- (void)scrollViewDidEndDragging:(UIScrollView *)scroll willDecelerate:(BOOL)decelerate
{
    if(!didTap && scroll.contentOffset.x == 0)
        [self setOn:YES animated:YES];
}
//////////////////////////////////////////////////////////////////
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    didTap = NO;
}
//////////////////////////////////////////////////////////////////
-(void)turnOn
{
    didTap = YES;
    [self setOn:YES animated:YES];
}
//////////////////////////////////////////////////////////////////
-(void)turnOff
{
    didTap = YES;
    [self setOn:NO animated:YES];
}
//////////////////////////////////////////////////////////////////
-(void)switchStateChanged
{
    //left empty on purpose, for subclasses
}
//////////////////////////////////////////////////////////////////

@end
