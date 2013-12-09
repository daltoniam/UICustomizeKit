//////////////////////////////////////////////////////////////////
//
//  BaseProgressView.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseProgressView.h"
#import "UIColor+BaseColor.h"

@interface BaseProgressView()

@property (nonatomic)float animateProgress;

@end

@implementation BaseProgressView

//////////////////////////////////////////////////////////////////
-(instancetype)init
{
    if(self = [super init])
    {
        self.backgroundColor = [UIColor clearColor];
        self.animateProgress = -1;
    }
    return self;
}
//////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    if(self.borderWidth > 0)
        frame = CGRectInset(frame, self.borderWidth, self.borderWidth);
    // draws background
    CGContextSaveGState(ctx);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:frame
                                           byRoundingCorners:self.corners
                                                 cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
    
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);
    
    NSMutableArray* newGradientColors = [NSMutableArray arrayWithCapacity:self.trackColors.count];
    for(UIColor* color in self.trackColors)
        [newGradientColors addObject:(id)color.CGColor];
    CGFloat* newGradientLocations = self.trackRange;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)newGradientColors, newGradientLocations);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, frame.size.height+self.borderWidth), 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(ctx);
    
    
    //draw the fill
    CGContextSaveGState(ctx);
    float current = self.animateProgress;
    if(current <= -1)
        current = self.progress;
    CGRect tintFrame = frame;
    tintFrame.size.width = tintFrame.size.width*current;
    
    UIRectCorner tintCorners = self.corners;
    if(current+0.02 < 1 && self.corners & UIRectCornerAllCorners)
        tintCorners = UIRectCornerBottomLeft | UIRectCornerTopLeft;
    
    path = [UIBezierPath bezierPathWithRoundedRect:tintFrame
                                 byRoundingCorners:tintCorners
                                       cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
    
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);
    
    NSMutableArray* fillGradientColors = [NSMutableArray arrayWithCapacity:self.colors.count];
    for(UIColor* color in self.colors)
        [fillGradientColors addObject:(id)color.CGColor];
    CGFloat* fillGradientLocations = self.colorRange;//{0.0, 1.0};
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)fillGradientColors, fillGradientLocations);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, frame.size.height+self.borderWidth), 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(ctx);
    
    //draw the border
    if(self.borderWidth > 0)
    {
        //frame = CGRectInset(frame, self.borderWidth, self.borderWidth);
        CGContextSaveGState(ctx);
        CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        
        CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:frame
                                               byRoundingCorners:self.corners
                                                     cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
        CGContextAddPath(ctx, path);
        
        CGContextStrokePath(ctx);
        CGContextRestoreGState(ctx);
    }
    
    if(self.animateProgress > -1 && (self.animateProgress+0.01 < self.progress || self.animateProgress-0.01 > self.progress) )
    {
        if(self.animateProgress < self.progress)
            self.animateProgress += 0.01;
        else
            self.animateProgress -= 0.01;
        [self performSelector:@selector(reloadView) withObject:nil afterDelay:0.01];
    }
    
}
//////////////////////////////////////////////////////////////////
-(void)setProgress:(CGFloat)pro
{
    if(pro > 1)
        pro = 1;
    if(pro < 0)
        pro = 0;
    self.animateProgress = -1;
    _progress = floor(pro * 100) / 100;
    [self setNeedsDisplay];
}
//////////////////////////////////////////////////////////////////
-(void)setProgress:(CGFloat)pro animated:(BOOL)animated
{
    if(pro > 1)
        pro = 1;
    if(pro < 0)
        pro = 0;
    if(animated)
        self.animateProgress = self.progress;
    else
        self.animateProgress = -1;
    _progress = floor(pro * 100) / 100;
    [self setNeedsDisplay];
}
//////////////////////////////////////////////////////////////////
-(void)reloadView
{
    [self setNeedsDisplay];
}
//////////////////////////////////////////////////////////////////
-(void)cleanup
{
    if(self.colorRange)
    {
        if(self.trackRange == self.colorRange)
            self.trackRange = NULL;
        free(self.colorRange);
        self.colorRange = NULL;
    }
    if(self.trackRange)
    {
        free(self.trackRange);
        self.trackRange = NULL;
    }
}
//////////////////////////////////////////////////////////////////
-(void)dealloc
{
    [self cleanup];
}
//////////////////////////////////////////////////////////////////

@end
