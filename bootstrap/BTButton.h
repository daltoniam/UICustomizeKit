//////////////////////////////////////////////////////////////////
//
//  BTButton.h
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseButton.h"

@interface BTButton : BaseButton

//create a new button with a color
+(BTButton*)buttonWithColor:(UIColor*)color;
+(BTButton*)backButtonWithColor:(UIColor*)color;

-(void)setColor:(UIColor*)color;

@end
