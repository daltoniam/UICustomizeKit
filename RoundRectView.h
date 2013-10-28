//////////////////////////////////////////////////////////////////
//
//  RoundRectView.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 Provides a Round Rectangle view for your enjoyment. Properties annotated as Required have to be set.
 */
@interface RoundRectView : UIView

///-------------------------------
/// @name Style Customizations
///-------------------------------

/**
 Set the normal fill color. Required.
 */
@property(nonatomic,strong)NSArray* colors;

/**
 Set the filll gradient. Required.
 */
@property(nonatomic,assign)CGFloat* colorRange;

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
 Set the width of the border.
 */
@property(nonatomic,assign)CGFloat borderWidth;

/**
 Set the color of the border.
 */
@property(nonatomic,strong)UIColor* borderColor;

///-------------------------------
/// @name factory methods
///-------------------------------

/**
 Returns an instance of a RoundRectView with provided color.
 
 @param Color of the Rectangle.
 @param Rounding of the Rectangle.
 
 @return Instance of RoundRectView.
 */
+(RoundRectView*)roundRectWithColor:(UIColor*)color rounding:(int)rounding;

/**
 Returns an instance of a RoundRectView with provided colors.
 
 @param Color of the Rectangle.
 @param Range for fill gradient.
 @param Rounding of the Rectangle.
 
 @return Instance of RoundRectView.
 */
+(RoundRectView*)roundRectWithColors:(NSArray*)colors ranges:(CGFloat*)ranges rounding:(int)rounding;

@end
