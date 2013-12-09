//////////////////////////////////////////////////////////////////
//
//  BaseSwitchView.h
//
//  Created by Dalton Cherry on 5/31/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 BaseSwitch works much like a UISwitch would. It allows several different customizations to the default styling of UISwitch. Properties annotated as Required have to be set.
 */
@interface BaseSwitchView : UIView <UIScrollViewDelegate>
{
    UIScrollView* scrollView;
    UIView* onView;
    UIView* offView;
    UIView* onBackgroundView;
    UIView* offBackgroundView;
    UIView* knobView;
    BOOL didTap;
} // need to refactor these.

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set what the "on" position text is.
 */
@property(nonatomic,strong)NSString* onText;

/**
 Set what the "off" position text is.
 */
@property(nonatomic,strong)NSString* offText;

/**
 Property for the background color in the on state
 */
@property(nonatomic,strong)UIColor* onBackgroundColor;

/**
 Property for the text color in the on state
 */
@property(nonatomic,strong)UIColor* onColor;

/**
 Property for the background color in the off state
 */
@property(nonatomic,strong)UIColor* offBackgroundColor;

/**
 Property for the text color in the on state
 */
@property(nonatomic,strong)UIColor* offColor;

/**
 See if the switch is in the "on" state.
 */
@property(nonatomic,readonly,getter=isOn)BOOL on;

/**
 Set the switch to the "on" state.
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated;


///-------------------------------
/// @name Method available for your subclasses to make style changes.
///-------------------------------

/**
 Use this view to customize what the "on" button view looks like.
 */
-(UIView*)onViewSetup;

/**
 Use this view to customize what the background of the "on" button view looks like.
 */
-(UIView*)onBackgroundViewSetup;

/**
 Use this view to customize what the "off" button view looks like.
 */
-(UIView*)offViewSetup;

/**
 Use this view to customize what the background of the "off" button view looks like.
 */
-(UIView*)offBackgroundViewSetup;

/**
 Use this view to customize what the knobs look like.
 */
-(UIView*)knobViewSetup;

/**
 Use this method to implement custom logic when the switch state changes.
 */
-(void)switchStateChanged;

@end
