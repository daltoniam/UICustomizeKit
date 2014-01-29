//////////////////////////////////////////////////////////////////
//
//  UITabBar+BaseStyle.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 Provides category methods for UITabBar.
 */
@interface UITabBar (BaseStyle)

///-------------------------------
/// @name Category Methods.
///-------------------------------

// will remove, ios 7 deprecated.
/**
 Set the image color and selected color.
 @param Set image color.
 @param Set the selected image color.
 */
//-(void)setImageColor:(UIColor*)color selected:(UIColor*)selectedColor UI_APPEARANCE_SELECTOR;

/**
 Set the text color and selected color.
 @param Set text color.
 @param Set the selected text color.
 */
-(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor UI_APPEARANCE_SELECTOR;

/**
 Set the font of the UITabBar.
 @param Set the font.
 */
-(void)setFont:(UIFont*)font UI_APPEARANCE_SELECTOR;

/**
 Set the text color and selected color.
 @param Set text color.
 @param Set the selected text color.
 */
+(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor;

/**
 Set the font of the UITabBar.
 @param Set the font.
 */
+(void)setFont:(UIFont*)font;

@end
