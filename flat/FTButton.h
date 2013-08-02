//////////////////////////////////////////////////////////////////
//
//  FTButton.h
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseButton.h"

@interface FTButton : BaseButton

@property(nonatomic,assign)BOOL isRaised;

//create a new button with a color
-(void)setColor:(UIColor*)color raised:(BOOL)raise;

+(FTButton*)buttonWithColor:(UIColor*)color raised:(BOOL)raise;
+(FTButton*)backButtonWithColor:(UIColor*)color raised:(BOOL)raise;

@end
