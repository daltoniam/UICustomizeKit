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
 Set an array of UIColors you want to cycle through
 */
@property(nonatomic,strong)NSArray *colorArray;

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
