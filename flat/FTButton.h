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

//create a new button with a color
-(void)setColor:(UIColor*)color;

+(FTButton*)buttonWithColor:(UIColor*)color;

@end
