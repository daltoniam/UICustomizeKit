//////////////////////////////////////////////////////////////////
//
//  RoundRectView.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "RoundRectView.h"

@implementation RoundRectView

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect
{
    CGRect frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:frame
                                           byRoundingCorners:UIRectCornerAllCorners
                                                 cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
    CGContextAddPath(ctx, path);
    CGContextClip(ctx);

    NSMutableArray* newGradientColors = [NSMutableArray arrayWithCapacity:self.colors.count];
    for(UIColor* color in self.colors)
        [newGradientColors addObject:(id)color.CGColor];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)newGradientColors, self.colorRange);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, frame.size.height), 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    if(self.borderWidth > 0 && self.borderColor)
    {
        CGContextSaveGState(ctx);
        
        CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
        CGContextSetLineWidth(ctx, self.borderWidth);
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        
        CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:frame
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
        CGContextAddPath(ctx, path);
        CGContextClip(ctx);
        
        path = [UIBezierPath bezierPathWithRoundedRect:frame
                                     byRoundingCorners:UIRectCornerAllCorners
                                           cornerRadii:CGSizeMake(self.rounding, self.rounding)].CGPath;
        CGContextAddPath(ctx, path);
        CGContextStrokePath(ctx);
        CGContextRestoreGState(ctx);
    }
    CGContextRestoreGState(ctx);
}
//////////////////////////////////////////////////////////////////
-(void)setColorRange:(CGFloat*)colorRange
{
    if(_colorRange)
        free(_colorRange);
    _colorRange = colorRange;
}
//////////////////////////////////////////////////////////////////
//factory method
+(RoundRectView*)roundRectWithColor:(UIColor*)color rounding:(int)rounding
{
    RoundRectView* rectView = [[RoundRectView alloc] init];
    rectView.colors = [NSArray arrayWithObjects:color,color,nil];
    rectView.rounding = rounding;
    
    CGFloat* newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    rectView.colorRange = newGradientLocations;
    return rectView;
}
//////////////////////////////////////////////////////////////////
+(RoundRectView*)roundRectWithColors:(NSArray*)colors ranges:(CGFloat*)ranges rounding:(int)rounding
{
    RoundRectView* rectView = [[RoundRectView alloc] init];
    rectView.colors = colors;
    rectView.colorRange = ranges;
    rectView.rounding = rounding;
    return rectView;
}
//////////////////////////////////////////////////////////////////

@end
