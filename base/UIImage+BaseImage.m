//////////////////////////////////////////////////////////////////
//
//  UIImage+BaseImage.m
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UIImage+BaseImage.h"
#import "CircleView.h"
#import "RoundRectView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (BaseImage)

//////////////////////////////////////////////////////////////////
-(UIImage*)capture
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0); //self.opaque
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
//////////////////////////////////////////////////////////////////

@end
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
@implementation UIImage (BaseImage)

//////////////////////////////////////////////////////////////////
//round rect images.
//////////////////////////////////////////////////////////////////
+(UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    RoundRectView* view = [RoundRectView roundRectWithColor:color rounding:cornerRadius];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    return [[view capture] resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}
//////////////////////////////////////////////////////////////////
+(UIImage*)imageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    RoundRectView* view = [RoundRectView roundRectWithColors:colors ranges:ranges rounding:cornerRadius];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    return [[view capture] resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}
//////////////////////////////////////////////////////////////////
//circle images. 
//////////////////////////////////////////////////////////////////
+(UIImage*)circleImageWithColor:(UIColor*)color size:(CGSize)size
{
    CircleView* view = [CircleView circleWithColor:color];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    return [view capture];
}
//////////////////////////////////////////////////////////////////
+(UIImage*)circleImageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size
{
    CircleView* view = [CircleView circleWithColors:colors ranges:ranges];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    return [view capture];
}
//////////////////////////////////////////////////////////////////
-(UIImage*)imageWithOverlayColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [self drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//////////////////////////////////////////////////////////////////

@end
