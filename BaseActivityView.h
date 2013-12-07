//////////////////////////////////////////////////////////////////
//
//  BaseActivityView.h
//
//  Created by Dalton Cherry on 12/6/13.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseActivityView : UIView

/**
 Set the width of the border.
 */
@property(nonatomic,assign)CGFloat borderWidth;

/**
 Set the color of the border.
 */
@property(nonatomic,strong)UIColor *borderColor;

/**
 Set which direction the loading moves is.
 */
@property(nonatomic,assign)BOOL isClockWise;

/**
 Set the progress of the progress bar. Just like UIProgressView it is the values between 0 and 1.
 */
@property(nonatomic,assign)CGFloat progress;

/**
 Set the progress of the progress bar with animation. Just like UIProgressView it is the values between 0 and 1.
 */
-(void)setProgress:(CGFloat)pro animated:(BOOL)animated;

@end
