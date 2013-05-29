//////////////////////////////////////////////////////////////////
//
//  UIImage+BaseImage.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>


@interface UIView (BaseImage)

-(UIImage*)capture;

@end

@interface UIImage (BaseImage)

//create images from shapes
+(UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+(UIImage*)imageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+(UIImage*)circleImageWithColor:(UIColor*)color size:(CGSize)size;
+(UIImage*)circleImageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size;

//change a images color to a new color
-(UIImage*)imageWithOverlayColor:(UIColor*)color;

@end
