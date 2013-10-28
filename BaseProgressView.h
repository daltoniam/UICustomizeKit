//////////////////////////////////////////////////////////////////
//
//  BaseProgressView.h
//  
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 BaseProgressView provides a simple way to create a progress view like one seen in Twitter bootstrap. Properties annotated as Required have to be set.
 */
@interface BaseProgressView : UIView

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set the normal fill color. Required.
 */
@property(nonatomic,strong)NSArray *colors;

/**
 Set the fill gradient. Required. Still required even if only one color is set.
 */
@property(nonatomic,assign)CGFloat *colorRange;

/**
 Set the background/track color. Required.
 */
@property(nonatomic,strong)NSArray *trackColors;

/**
 Set the background/track gradient. Required. Still required even if only one color is set.
 */
@property(nonatomic,assign)CGFloat *trackRange;

/**
 Set the width of the border.
 */
@property(nonatomic,assign)CGFloat borderWidth;

/**
 Set the color of the border.
 */
@property(nonatomic,strong)UIColor *borderColor;

/**
 Set the amount to round the corners.
 Need to set which corners to round with the corners property for this to take effect.
 */
@property(nonatomic,assign)CGFloat rounding;

/**
 Set which corners to round. The rounding property sets how much.
 */
@property(nonatomic,assign)UIRectCorner corners;

/**
 Set the progress of the progress bar. Just like UIProgressView it is the values between 0 and 1.
 */
@property(nonatomic,assign)CGFloat progress;

/**
 Set the progress of the progress bar with animation. Just like UIProgressView it is the values between 0 and 1.
 */
-(void)setProgress:(CGFloat)pro animated:(BOOL)animated;

///-------------------------------
/// @name Clean up Routines
///-------------------------------

/**
 Frees the CGFloat arrays. You should not need to call this, BaseProgressView should take care of the cleanup for you.
 */
-(void)cleanup;

@end
