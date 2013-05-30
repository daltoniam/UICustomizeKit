//////////////////////////////////////////////////////////////////
//
//  RoundRectView.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface RoundRectView : UIView

//your normal fill color
@property(nonatomic,strong)NSArray* colors;

//the float filll gradient
@property(nonatomic,assign)CGFloat* colorRange;

//the amount to round the corners
@property(nonatomic,assign)CGFloat rounding;

//the width of the border
@property(nonatomic,assign)CGFloat borderWidth;

//the width of the border
@property(nonatomic,strong)UIColor* borderColor;

//factory methods
+(RoundRectView*)roundRectWithColor:(UIColor*)color rounding:(int)rounding;
+(RoundRectView*)roundRectWithColors:(NSArray*)colors ranges:(CGFloat*)ranges rounding:(int)rounding;

@end
