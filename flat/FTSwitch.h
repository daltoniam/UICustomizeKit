//////////////////////////////////////////////////////////////////
//
//  FTSwitch.h
//
//  Created by Dalton Cherry on 5/31/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseSwitchView.h"

@interface FTSwitch : BaseSwitchView

//the background color in the on state
@property(nonatomic,strong)UIColor* onBackgroundColor;

//the text and knob color in the on state
@property(nonatomic,strong)UIColor* onColor;

@property(nonatomic,strong)UIColor* offBackgroundColor;

//the text and knob color in the off state
@property(nonatomic,strong)UIColor* offColor;

@end
