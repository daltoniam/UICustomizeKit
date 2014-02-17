//////////////////////////////////////////////////////////////////
//
//  UIImage+BaseImage.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 Provides category methods for UIView.
 */
@interface UIWindow (BaseImage)

///-------------------------------
/// @name Category Methods.
///-------------------------------

/**
 Create an image from the whole window.
 @return Returns a UIImage representation of that window.
 */
+(UIImage*)capture;

@end

/**
 Provides category methods for UIView.
 */
@interface UIView (BaseImage)

///-------------------------------
/// @name Category Methods.
///-------------------------------

/**
 Create an image from the view.
 @return Returns a UIImage representation of that view.
 */
-(UIImage*)capture;

/**
 Create an image from the shape. (Still working on...)
 @param CGRect of area to crop image.
 @return Returns a UIImage representation of that view within the rect bounds.
 */
-(UIImage*)capture:(CGRect)rect;


/**
 Create an image from the shape. (Still working on...)
 @param CGRect of area to crop image.
 @return Returns a blur version of the UIImage representation of that view within the rect bounds.
 */
//-(UIImage*)captureBlur:(CGRect)rect;

/**
 Blur the view's background. This replace the view's background color. 
 The view MUST have a frame and a superview before calling this.
 */
//-(void)blurView;

@end

/**
 Provides category methods for UIImage.
 */
@interface UIImage (BaseImage)

///-------------------------------
/// @name Category Methods.
///-------------------------------

/**
 Create an image from the shape.
 @param Color of shape.
 @param Size of shape.
 @param Corner of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

/**
 Create an image from the shape.
 @param Array of colors for the shape.
 @param Range of gradient.
 @param Size of shape.
 @param Corner of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)imageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

/**
 Create an image from the shape.
 @param Color of shape.
 @param Size of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size;

/**
 Create a circle image.
 @param Array of colors for the shape.
 @param Range of gradient.
 @param Size of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)imageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size;

/**
 Create images from shapes.
 @param Color of shape.
 @param Size of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)circleImageWithColor:(UIColor*)color size:(CGSize)size;

/**
 Create a circle image.
 @param Array of colors for the shape.
 @param Range of gradient.
 @param Size of shape.
 @return Returns a UIImage that looks like the shape.
 */
+(UIImage*)circleImageWithColors:(NSArray*)colors ranges:(CGFloat*)ranges size:(CGSize)size;

/**
 Create images with a colored border.
 @param Color of border.
 @param Width of border.
 @param Corner of shape.
 @return Returns a UIImage with a color border.
 */
+(UIImage*)imageWithBorder:(UIColor*)color bodyColor:(UIColor*)bodyColor width:(float)width cornerRadius:(CGFloat)cornerRadius;

/**
 Changes an image's color to a new color.
 @param New color.
 @return Returns a UIImage with new color.
 */
-(UIImage*)imageWithOverlayColor:(UIColor*)color;

/**
 Fixes image orientation.
 @return Returns a UIImage with corrected orientation.
 */
- (UIImage*)fixOrientation;

/**
 Changes an image's color to a new color.
 @param CGRect of area to crop image.
 @return Returns a newly cropped image.
 */
-(UIImage*)cropImage:(CGRect)rect;

@end
