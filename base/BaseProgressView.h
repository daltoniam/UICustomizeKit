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

//the float fill gradient
@property(nonatomic,assign)CGFloat* colorRange;

//your background/track color
@property(nonatomic,strong)NSArray* trackColors;

//the float background/track gradient
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
