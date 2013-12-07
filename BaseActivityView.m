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
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)commonInit
{
    self.borderColor = [UIColor blackColor];
    self.borderWidth = 2;
    self.backgroundColor = [UIColor clearColor];
    self.isClockWise = YES; //TODO: need to swap the caculation of the curve when counter clockwise...
}
//////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect frame = CGRectMake(0, 0, floorf(self.frame.size.width), floorf(self.frame.size.height));
    
    float current = self.animateProgress;
    if(current <= -1)
        current = self.progress;
    
    CGContextSaveGState(ctx);
    CGFloat start = DEGREES_TO_RADIANS(270);
    CGFloat end = DEGREES_TO_RADIANS(current*360) + start;
    CGPathRef path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width/2, frame.size.height/2)
                                                         radius:floorf(self.frame.size.width/2 - self.borderWidth/2)
                                                     startAngle:start
                                                       endAngle:end
                                                      clockwise:self.isClockWise].CGPath;
    
    CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
    CGContextSetLineWidth(ctx, self.borderWidth);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    
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

@end
