//////////////////////////////////////////////////////////////////
//
//  CircleView.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface CircleView : UIView

//your normal fill color
@property(nonatomic,strong)NSArray* colors;

//the float filll gradient
@property(nonatomic,assign)CGFloat* colorRange;

//add some padding around the circle so it does not fill the whole view
@property(nonatomic,assign)CGFloat padding;

//factory methods
+(CircleView*)circleWithColor:(UIColor*)color;
+(CircleView*)circleWithColors:(NSArray*)colors ranges:(CGFloat*)ranges;

@end
