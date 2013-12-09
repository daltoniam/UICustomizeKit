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

@interface BaseActivityView ()

@property (nonatomic)float animateProgress;

@property (nonatomic,assign)int currentIndex;

@property(nonatomic,assign)int sliceIndex;

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
    self.sliceWidth = 12;
    self.backgroundColor = [UIColor clearColor];
    self.currentIndex = 0;
    self.colorArray = @[[UIColor colorWithWhite:0.8 alpha:1],[UIColor colorWithWhite:0.4 alpha:1],[UIColor colorWithWhite:0.2 alpha:1]];
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
    UIColor *color = [self nextColor];
    int i = 0;
    while(walk < end)
    {
        [self drawSlice:ctx start:start end:walk color:color];
        start = walk + pad;
        walk += step;
        if(i >= self.sliceIndex)
            color = [self currentColor];
        i++;
    }
    
    if(self.isAnimating)
    {
        if(self.sliceIndex >= i)
        {
            self.sliceIndex = 0;
            self.currentIndex++;
            if(self.currentIndex >= self.colorArray.count)
                self.currentIndex = 0;
        }
        else
            self.sliceIndex++;
        
        [self performSelector:@selector(reloadView) withObject:nil afterDelay:0.08];
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
-(UIColor*)currentColor
{
    return self.colorArray[self.currentIndex];
}
//////////////////////////////////////////////////////////////////
-(UIColor*)nextColor
{
    int next = self.currentIndex+1;
    if(next >= self.colorArray.count)
        next = 0;
    
    return self.colorArray[next];
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
