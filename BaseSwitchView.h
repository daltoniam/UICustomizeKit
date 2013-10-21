//////////////////////////////////////////////////////////////////
//
//  BaseSwitchView.h
//
//  Created by Dalton Cherry on 5/31/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseSwitchView : UIView <UIScrollViewDelegate>
{
    UIScrollView* scrollView;
    UIView* onView;
    UIView* offView;
    UIView* onBackgroundView;
    UIView* offBackgroundView;
    UIView* knobView;
    BOOL didTap;
}
//set the on Text
@property(nonatomic,strong)NSString* onText;

//set the offText
@property(nonatomic,strong)NSString* offText;

//check if the switch is on
@property(nonatomic,getter=isOn)BOOL on;

//set the state of the switch
- (void)setOn:(BOOL)on animated:(BOOL)animated;


//so your subclass can call super on these
-(UIView*)onViewSetup;
-(UIView*)onBackgroundViewSetup;
-(UIView*)offViewSetup;
-(UIView*)offBackgroundViewSetup;
-(UIView*)knobViewSetup;

-(void)switchStateChanged;

@end
