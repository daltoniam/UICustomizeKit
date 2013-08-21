//////////////////////////////////////////////////////////////////
//
//  BTSlider.m
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BTSlider.h"
#import "UIColor+BaseColor.h"

@implementation BTSlider

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self sharedInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)sharedInit
{
}
//////////////////////////////////////////////////////////////////
-(void)setColor:(UIColor*)color
{
    UIColor* fillColor = [UIColor colorWithWhite:0.97 alpha:1];
    self.trackColors = @[[UIColor colorWithWhite:0.92 alpha:1],fillColor,fillColor];
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*3);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 0.12;
    newGradientLocations[2] = 1.0;
    self.trackRange = newGradientLocations;
    
    UIColor* thumbColor = [color adjustColor:-0.1];
    UIColor* selectColor = [color adjustColor:-0.2];
    self.colors = @[color,[color adjustColor:-0.12]];
    
    newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.colorRange = newGradientLocations;
    
    self.thumbColors = @[thumbColor,[thumbColor adjustColor:-0.12]];
    self.thumbSelectedColors = @[selectColor,[selectColor adjustColor:-0.12]];
    
    newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.colorRange = self.thumbRange = self.thumbSelectedRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
+(BTSlider*)sliderWithColor:(UIColor*)color
{
    BTSlider* slider = [[BTSlider alloc] init];
    [slider setColor:color];
    return slider;
}
//////////////////////////////////////////////////////////////////

@end
