//////////////////////////////////////////////////////////////////
//
//  BaseRadialProgressView.h
//
//  Created by Dalton Cherry on 12/8/13.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseRadialProgressView : UIView

/**
 Set the width of the border.
 */
@property(nonatomic,assign)CGFloat borderWidth;

/**
 Set the color of the border.
 */
@property(nonatomic,strong)UIColor *borderColor;

/**
 Set the color of the track color.
 */
@property(nonatomic,strong)UIColor *trackColor;

/**
 Set which direction the loading moves is.
 */
@property(nonatomic,assign)BOOL isClockWise;

/**
 Set to YES to have square edges instead of rounded ones.
 */
@property(nonatomic,assign)BOOL squaredEdges;

/**
 Set the progress of the progress bar. Just like UIProgressView it is the values between 0 and 1.
 */
@property(nonatomic,assign)CGFloat progress;


/**
 Set the progress of the progress bar with animation. Just like UIProgressView it is the values between 0 and 1.
 */
-(void)setProgress:(CGFloat)pro animated:(BOOL)animated;

@end
