//
//  BaseSlider.m
//  iOSTester
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 Lightspeed Systems. All rights reserved.
//

#import "BaseSlider.h"
#import "UIImage+BaseImage.h"

@implementation BaseSlider

//////////////////////////////////////////////////////////////////
-(void)setColors:(NSArray*)colors
{
    _colors = colors;
    [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setColorRange:(CGFloat *)colorRange
{
    if(_colorRange)
        free(_colorRange);
    _colorRange = colorRange;
    if(colorRange)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setTrackColors:(NSArray *)trackColors
{
    _trackColors = trackColors;
    if(trackColors)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setTrackRange:(CGFloat*)trackRange
{
    if(_trackRange)
        free(_trackRange);
    _trackRange = trackRange;
    if(trackRange)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setThumbColors:(NSArray *)thumbColors
{
    _thumbColors = thumbColors;
    if(thumbColors)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setThumbRange:(CGFloat *)thumbRange
{
    if(_thumbRange)
        free(_thumbRange);
    _thumbRange = thumbRange;
    if(thumbRange)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setThumbSelectedColors:(NSArray *)thumbSelectedColors
{
    _thumbSelectedColors = thumbSelectedColors;
    if(thumbSelectedColors)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)setThumbSelectedRange:(CGFloat *)thumbSelectedRange
{
    if(_thumbSelectedRange)
        free(_thumbSelectedRange);
    _thumbSelectedRange = thumbSelectedRange;
    if(thumbSelectedRange)
        [self updateImages];
}
//////////////////////////////////////////////////////////////////
-(void)updateImages
{
    if(self.colors.count > 0 && self.colorRange && self.trackColors.count > 0 && self.trackRange)
    {
        CGSize size = CGSizeMake(10, 10);
        CGFloat radius = 5.0;
        UIImage *progressImage = [UIImage imageWithColors:self.colors ranges:self.colorRange size:size cornerRadius:radius];
        UIImage *trackImage = [UIImage imageWithColors:self.trackColors ranges:self.trackRange size:size cornerRadius:radius];
        
        [self setMinimumTrackImage:progressImage forState:UIControlStateNormal];
        [self setMaximumTrackImage:trackImage forState:UIControlStateNormal];
    }
    
    if(self.thumbColors.count > 0 && self.thumbRange)
    {
        UIImage *normalSliderImage = [UIImage circleImageWithColors:self.thumbColors ranges:self.thumbRange size:CGSizeMake(24, 24)];
        [self setThumbImage:normalSliderImage forState:UIControlStateNormal];
    }
    if(self.thumbSelectedColors.count > 0 && self.thumbSelectedRange)
    {
        UIImage *highlighedSliderImage = [UIImage circleImageWithColors:self.thumbSelectedColors ranges:self.thumbSelectedRange size:CGSizeMake(24, 24)];
        [self setThumbImage:highlighedSliderImage forState:UIControlStateHighlighted];
    }
}
//////////////////////////////////////////////////////////////////
-(void)dealloc
{
    self.trackRange = nil;
    self.thumbSelectedRange = nil;
    self.thumbRange = nil;
}
//////////////////////////////////////////////////////////////////

@end
