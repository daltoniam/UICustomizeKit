//
//  FTSlider.m
//  iOSTester
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 Lightspeed Systems. All rights reserved.
//

#import "FTSlider.h"
#import "UIColor+BaseColor.h"

@implementation FTSlider

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
    UIColor* trackColor = [UIColor colorWithRed:235/255.0f green:237/255.0f blue:239/255.0f alpha:1];
    self.trackColors = @[trackColor,trackColor];
    
    UIColor* mainColor = color;
    UIColor* thumbColor = [mainColor adjustColor:-0.1];
    UIColor* selectColor = [mainColor adjustColor:-0.2];
    self.colors = @[mainColor,mainColor];
    self.thumbColors = @[thumbColor,thumbColor];
    self.thumbSelectedColors = @[selectColor,selectColor];
    
    CGFloat *newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    self.colorRange = self.trackRange = self.thumbRange = self.thumbSelectedRange = newGradientLocations;
}
//////////////////////////////////////////////////////////////////
+(FTSlider*)sliderWithColor:(UIColor*)color
{
    FTSlider* slider = [[FTSlider alloc] init];
    [slider setColor:color];
    return slider;
}
//////////////////////////////////////////////////////////////////

@end
