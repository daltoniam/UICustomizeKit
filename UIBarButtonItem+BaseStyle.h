//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+BaseStyle.h
//
//  Created by Dalton Cherry on 6/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 Provides category methods for UIBarButtonItem.
 */
@interface UIBarButtonItem (BaseStyle)

///-------------------------------
/// @name Category Methods.
///-------------------------------

/**
 Set the font.
 @param The font you would like.
 */
-(void)setFont:(UIFont*)font;

/**
 Set the font.
 @param The font you would like.
 */
+(void)setFont:(UIFont*)font;

/**
 Set the font.
 @param The font you would like.
 @param Contained in Class.
 */
+(void)setFont:(UIFont*)font whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ...;

/**
 Set the attributes for the button's state.
 @param attributes for button.
 @param UIButton state.
 @return Dictionary of text attributes.
 */
+(NSMutableDictionary*)titleTextAttribs:(id)appearance forState:(UIControlState)state;

@end
