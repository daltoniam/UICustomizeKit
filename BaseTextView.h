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

@interface BaseTextView : UITextView
{
    UILabel* placeHolderLabel;
}

-(void)updateState:(textState)state;

//the amount to round the corners
@property(nonatomic,assign)CGFloat rounding;

//the place holder text (still in progress)
//@property(nonatomic,assign)NSString* placeholder;

//the width of the border
@property(nonatomic,assign)CGFloat borderWidth;

//default textColor
@property(nonatomic,strong) UIColor *mainTextColor;

//border color of view
@property(nonatomic,strong) UIColor *borderColor;

//body color of view
@property(nonatomic,strong) UIColor *bodyColor;

//selected textColor
@property(nonatomic,strong) UIColor *selectedTextColor;

//border color of view in selected state
@property(nonatomic,strong) UIColor *selectedBorderColor;

//body color of view in selected state
@property(nonatomic,strong) UIColor *selectedBodyColor;

//disabled textColor
@property(nonatomic,strong) UIColor *disabledTextColor;

//border color of view in disabled state
@property(nonatomic,strong) UIColor *disabledBorderColor;

//body color of view in disabled state
@property(nonatomic,strong) UIColor *disabledBodyColor;

//add inner padding for the text field
@property(nonatomic,assign)CGFloat padding;

@end
