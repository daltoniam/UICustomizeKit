//////////////////////////////////////////////////////////////////
//
//  BaseButton.h
//  iOSTester
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseButton : UIButton

//your normal fill color
@property(nonatomic,strong)NSArray* colors;

//the float filll gradient
@property(nonatomic,assign)CGFloat* colorRange;

//your selected/hightlight color
@property(nonatomic,strong)NSArray* selectedColors;

//the float selected gradient
@property(nonatomic,assign)CGFloat* selectedRange;

//your disabled color
@property(nonatomic,strong)NSArray* disabledColors;

//the float disabled gradient
@property(nonatomic,assign)CGFloat* disabledRange;

//the width of the border
@property(nonatomic,assign)CGFloat borderWidth;

//the width of the border
@property(nonatomic,strong)UIColor* borderColor;

//the amount to round the corners
@property(nonatomic,assign)CGFloat rounding;

//the corners to round
@property(nonatomic,assign)UIRectCorner corners;

@end