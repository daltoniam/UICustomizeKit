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
 Set the width of the slices.
 */
@property(nonatomic,assign)CGFloat sliceWidth;

/**
 Set loading color.
 */
@property(nonatomic,strong)UIColor *sliceColor;

/**
 Set loading color.
 */
@property(nonatomic,strong)UIColor *trackColor;

/**
 Lighten the sliceColor for each segment. Default is no.
 */
@property(nonatomic,assign)BOOL shouldLightenSlices;

/**
 Check if the view is currently animating
 */
@property(nonatomic,assign,readonly)BOOL isAnimating;

/**
 Set if the view is loading state
 */
-(void)startAnimating;

/**
 Set if the view is not loading state
 */
-(void)stopAnimating;


@end
