//////////////////////////////////////////////////////////////////
//
//  BaseSlider.h
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 BaseSlider is a subclass of UISlider. It provides several different customizations to the default styling of UISlider. Properties annotated as Required have to be set.
 */
@interface BaseSlider : UISlider

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set the fill color part of the slider. Required.
 */
@property(nonatomic,strong)NSArray* colors;

/**
 Set the fill gradient. Required even if only one color is set. Required.
 */
@property(nonatomic,assign)CGFloat* colorRange;

/**
 Set the background/track color. Required.
 */
@property(nonatomic,strong)NSArray* trackColors;

/**
 Set the background/track gradient. Reequired even if only one color is set. Required.
 */
@property(nonatomic,assign)CGFloat* trackRange;

/**
 Set the thumb colors. (The actual circle control)
 */
@property(nonatomic,strong)NSArray* thumbColors;

/**
 Set the fill gradient of the thumb.
 */
@property(nonatomic,assign)CGFloat* thumbRange;

/**
 Set the selected thumb colors.
 */
@property(nonatomic,strong)NSArray* thumbSelectedColors;

/**
 Set the selected float fill gradient of the thumb.
 */
@property(nonatomic,assign)CGFloat* thumbSelectedRange;

@end
