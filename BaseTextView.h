//////////////////////////////////////////////////////////////////
//
//  BaseTextView.h
//
//  Created by Dalton Cherry on 8/8/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>
#import "BaseText.h"

/**
 BaseTextView is a subclass of UITextView. It provides several different customizations to the default styling of UITextView. Properties annotated as Required have to be set.
 */
@interface BaseTextView : UITextView

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set the amount to round the corners.
 */
@property(nonatomic,assign)CGFloat rounding;

/**
 Set the width of the border.
 */
@property(nonatomic,assign)CGFloat borderWidth;

/**
 Set default text color.
 */
@property(nonatomic,strong) UIColor *mainTextColor;

/**
 Set border color of view.
 */
@property(nonatomic,strong) UIColor *borderColor;

/**
 Set thebody color of view.
 */
@property(nonatomic,strong) UIColor *bodyColor;

/**
 Set the selected text color.
 */
@property(nonatomic,strong) UIColor *selectedTextColor;

/**
 Set the border color of view in selected state.
 */
@property(nonatomic,strong) UIColor *selectedBorderColor;

/**
 Set the body color of view in selected state.
 */
@property(nonatomic,strong) UIColor *selectedBodyColor;

/**
 Set the disabled text color.
 */
@property(nonatomic,strong) UIColor *disabledTextColor;

/**
 Set the border color of view in disabled state.
 */
@property(nonatomic,strong) UIColor *disabledBorderColor;

/**
 Set the body color of view in disabled state.
 */
@property(nonatomic,strong) UIColor *disabledBodyColor;

/**
 Add inner padding for the text field.
 */
@property(nonatomic,assign)CGFloat padding;

/**
 Set the placeholder text.
 */
@property(nonatomic,copy)NSString *placeholder;

/**
 Set the placeholder color.
 */
@property(nonatomic,strong)UIColor *placeholderColor;

///-------------------------------
/// @name Methods
///-------------------------------

/**
 Update the state of the text field. Whether it is disabled, selected, etc.
 */
-(void)updateState:(textState)state;

@end
