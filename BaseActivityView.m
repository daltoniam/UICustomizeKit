//////////////////////////////////////////////////////////////////
//
//  BaseActivityView.m
//  iOSTester
//
//  Created by Dalton Cherry on 12/6/13.
//
//////////////////////////////////////////////////////////////////

#import "BaseActivityView.h"
#import <math.h>
#import "UIColor+BaseColor.h"

@interface BaseActivityView ()

@property (nonatomic)float animateProgress;

@property (nonatomic,assign)int currentIndex;

@property(nonatomic,assign)int sliceIndex;

@property(nonatomic,assign)int totalSlices;

@property(nonatomic,strong)NSArray *colorArray;

@end

@implementation BaseActivityView

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
        if(frame.size.width > 0)
            self.sliceWidth = frame.size.width/4;
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    self.shouldLightenSlices = NO;
    self.sliceIndex = 0;
    self.sliceWidth = 12;
    self.backgroundColor = [UIColor clearColor];
    self.currentIndex = 0;
    self.trackColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.sliceColor = [UIColor grayColor];
}
//////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat start = DEGREES_TO_RADIANS(270);
    //current = 1.0f;
    CGFloat end = DEGREES_TO_RADIANS(360) + start;
    CGFloat step = DEGREES_TO_RADIANS(30);
    CGFloat walk = start+step;
    CGFloat pad = DEGREES_TO_RADIANS(5);
    walk -= pad;
    UIColor *color = self.trackColor;
    int i = 0;
    int count = 0;
    int thresh = 4;
    if(self.totalSlices > 0 && self.sliceIndex == self.totalSlices)
        self.sliceIndex = 0;
    while(walk < end)
    {
        UIColor *localColor = color;
        if(self.sliceIndex+thresh >= self.totalSlices && self.totalSlices > 0)
        {
            int k = (self.sliceIndex+thresh) - self.totalSlices;
            k -= i;
            if(self.sliceIndex == self.totalSlices)
                k -= 1;
            if(k >= 0)
            {
                if(self.shouldLightenSlices)
                    localColor = self.colorArray[(thresh-1)-k];
                else
                    localColor = self.sliceColor;
            }
        }
        
        [self drawSlice:ctx start:start end:walk color:localColor];
        start = walk + pad;
        walk += step;
        if(i >= self.sliceIndex)
        {
            if(count >= thresh)
                color = self.trackColor;
            else if(self.shouldLightenSlices)
                color = self.colorArray[count];
            else
                color = self.sliceColor;
            count++;
        }
        i++;
    }
    if(self.totalSlices == 0)
        self.totalSlices = i;
    
    if(self.isAnimating)
    {
        if(self.sliceIndex >= i)
        {
            self.sliceIndex = 0;
        }
        else
            self.sliceIndex++;
        
        [self performSelector:@selector(reloadView) withObject:nil afterDelay:0.1]; //08
    }
}
//////////////////////////////////////////////////////////////////
-(void)drawSlice:(CGContextRef)ctx start:(CGFloat)start end:(CGFloat)end color:(UIColor*)color
{
    CGContextSaveGState(ctx);
    CGPathRef path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                    radius:floorf(self.frame.size.width/2 - self.sliceWidth/2)
                                                startAngle:start
                                                  endAngle:end
                                                 clockwise:YES].CGPath;
    
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetLineWidth(ctx, self.sliceWidth);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
}
//////////////////////////////////////////////////////////////////
-(void)setSliceColor:(UIColor *)sliceColor
{
    _sliceColor = sliceColor;
    if(self.shouldLightenSlices)
        self.colorArray = @[[sliceColor adjustColor:0.3],[sliceColor adjustColor:0.2],[sliceColor adjustColor:0.1],sliceColor];
}
//////////////////////////////////////////////////////////////////
-(void)startAnimating
{
    _isAnimating = YES;
}
//////////////////////////////////////////////////////////////////
-(void)stopAnimating
{
    _isAnimating = NO;
}
//////////////////////////////////////////////////////////////////
-(void)reloadView
{
    [self setNeedsDisplay];
}
//////////////////////////////////////////////////////////////////

@end
