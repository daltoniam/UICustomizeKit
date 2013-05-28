//////////////////////////////////////////////////////////////////
//
//  BaseProgressView.h
//  iOSTester
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseProgressView : UIView
{
    float animateProgress;
}
//frees the CGFloat arrays
-(void)cleanup;

//your normal fill color
@property(nonatomic,strong)NSArray* colors;

//the float filll gradient
@property(nonatomic,assign)CGFloat* colorRange;

//your selected/hightlight color
@property(nonatomic,strong)NSArray* trackColors;

//the float selected gradient
@property(nonatomic,assign)CGFloat* trackRange;

//the width of the border
@property(nonatomic,assign)CGFloat borderWidth;

//the width of the border
@property(nonatomic,strong)UIColor* borderColor;

//the amount to round the corners
@property(nonatomic,assign)CGFloat rounding;

//the corners to round
@property(nonatomic,assign)UIRectCorner corners;

//the progress of the bar
@property(nonatomic,assign)CGFloat progress;

//set the progress bar with animation
-(void)setProgress:(CGFloat)pro animated:(BOOL)animated;

@end
