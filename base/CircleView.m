//////////////////////////////////////////////////////////////////
//
//  CircleView.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "CircleView.h"

@implementation CircleView

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
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    NSMutableArray* newGradientColors = [NSMutableArray arrayWithCapacity:self.colors.count];
    for(UIColor* color in self.colors)
        [newGradientColors addObject:(id)color.CGColor];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)newGradientColors, self.colorRange);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, self.frame.size.height), 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(ctx);
    //CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    CGContextFillPath(ctx);
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
+(CircleView*)circleWithColor:(UIColor*)color
{
    CircleView* circle = [[CircleView alloc] init];
    circle.colors = [NSArray arrayWithObjects:color,color,nil];
    
    CGFloat* newGradientLocations = (CGFloat*)malloc(sizeof(CGFloat)*2);
    newGradientLocations[0] = 0;
    newGradientLocations[1] = 1.0;
    circle.colorRange = newGradientLocations;
    return circle;
}
//////////////////////////////////////////////////////////////////
+(CircleView*)circleWithColors:(NSArray*)colors ranges:(CGFloat*)ranges
{
    CircleView* circle = [[CircleView alloc] init];
    circle.colors = colors;
    circle.colorRange = ranges;
    return circle;
}
//////////////////////////////////////////////////////////////////

@end
