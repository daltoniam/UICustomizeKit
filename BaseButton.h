//////////////////////////////////////////////////////////////////
//
//  BaseButton.h
//
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 BaseButton is a subclass of UIButton. It provides several different customizations to the default styling of UIButton. Properties annotated as Required have to be set.
 */
@interface BaseButton : UIButton

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set the normal fill color. Required.
 */
@property(nonatomic,strong)NSArray *colors;

/**
 Set the fill gradient. Required, even if only one color is set.
 */
@property(nonatomic,assign)CGFloat *colorRange;

/**
 Set the selected/hightlight color.
 */
@property(nonatomic,strong)NSArray *selectedColors;

/**
 Set the float selected gradient.
 */
@property(nonatomic,assign)CGFloat *selectedRange;

/**
 Set the disabled color.
 */
@property(nonatomic,strong)NSArray *disabledColors;

/**
 Set the float disabled gradient.
 */
@property(nonatomic,assign)CGFloat *disabledRange;

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
 Set if this is a back navigation stylized button.
 */
@property(nonatomic,assign)BOOL isBackButton;

/**
 Set which corners to round. The rounding property sets how much.
 */
@property(nonatomic,assign)UIRectCorner corners;

///-------------------------------
/// @name Clean up Routines
///-------------------------------

/**
 Frees the CGFloat arrays. You should not need to call this, BaseButton should take care of the cleanup for you.
 */
- (void)cleanup;

@end