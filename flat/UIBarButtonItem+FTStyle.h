//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+FTStyle.h
//
//  Created by Dalton Cherry on 5/29/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FTStyle)

+(void)setFlatButtonColors:(UIColor*)color UI_APPEARANCE_SELECTOR;
-(void)setFlatColor:(UIColor*)color UI_APPEARANCE_SELECTOR;

@end
