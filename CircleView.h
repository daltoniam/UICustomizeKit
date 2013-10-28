//////////////////////////////////////////////////////////////////
//
//  CircleView.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

/**
 Provides a circual view for your enjoyment. Properties annotated as Required have to be set.
 */
@interface CircleView : UIView

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
 Add some padding around the circle so it does not fill the whole view.
 */
@property(nonatomic,assign)CGFloat padding;

///-------------------------------
/// @name factory methods
///-------------------------------

/**
 Returns an instance of a CircleView with provided color.
 
 @param Color of circle.
 
 @return Instance of CircleView.
 */
+(CircleView*)circleWithColor:(UIColor*)color;

/**
 Returns an instance of a CircleView with provided colors.
 
 @param Color of circle.
 @param Range for fill gradient.
 
 @return Instance of CircleView.
 */
+(CircleView*)circleWithColors:(NSArray*)colors ranges:(CGFloat*)ranges;

@end
