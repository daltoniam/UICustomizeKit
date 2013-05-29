//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+BTStyle.h
//
//  Created by Dalton Cherry on 5/29/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BTStyle)

+(void)setBTButtonColors:(UIColor*)color UI_APPEARANCE_SELECTOR;
-(void)setBTColor:(UIColor*)color UI_APPEARANCE_SELECTOR;

@end
