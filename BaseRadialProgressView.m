//////////////////////////////////////////////////////////////////
//
//  BaseRadialProgressView.m
//
//  Created by Dalton Cherry on 12/8/13.
//
//////////////////////////////////////////////////////////////////

#import "BaseRadialProgressView.h"

@interface BaseRadialProgressView ()

@property (nonatomic)float animateProgress;

@end

@implementation BaseRadialProgressView

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
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
-(void)commonInit
{
    self.borderColor = [UIColor blackColor];
    self.borderWidth = 2;
    self.backgroundColor = [UIColor clearColor];
    self.isClockWise = YES;
}
//////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGRect frame = CGRectMake(0, 0, floorf(self.frame.size.width), floorf(self.frame.size.height));
    
    float current = self.animateProgress;
    if(current <= -1)
        current = self.progress;
    if(!self.isClockWise)
        current = -current;
    
    CGFloat start = DEGREES_TO_RADIANS(270);
    if(self.trackColor)
    {
        CGFloat trackEnd = DEGREES_TO_RADIANS(360);
        if(!self.isClockWise)
            trackEnd = DEGREES_TO_RADIANS(-360);
        trackEnd += start;
        [self drawSlice:ctx start:start end:trackEnd color:self.trackColor];
    }
    
    CGFloat end = DEGREES_TO_RADIANS(current*360) + start;
    [self drawSlice:ctx start:start end:end color:self.borderColor];
    
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
-(void)drawSlice:(CGContextRef)ctx start:(CGFloat)start end:(CGFloat)end color:(UIColor*)color
{
    CGContextSaveGState(ctx);
    CGPathRef path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                    radius:floorf(self.frame.size.width/2 - self.borderWidth/2)
                                                startAngle:start
                                                  endAngle:end
                                                 clockwise:self.isClockWise].CGPath;
    
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetLineWidth(ctx, self.borderWidth);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    if(self.squaredEdges)
        CGContextSetLineCap(ctx, kCGLineCapSquare);
    else
        CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
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


@end
