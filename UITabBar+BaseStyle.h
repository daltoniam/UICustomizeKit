//////////////////////////////////////////////////////////////////
//
//  UITabBar+BaseStyle.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface UITabBar (BaseStyle)

-(void)setImageColor:(UIColor*)color selected:(UIColor*)selectedColor UI_APPEARANCE_SELECTOR;
-(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor UI_APPEARANCE_SELECTOR;
-(void)setFont:(UIFont*)font UI_APPEARANCE_SELECTOR;

+(void)setTextColor:(UIColor*)color selected:(UIColor*)selectedColor;
+(void)setFont:(UIFont*)font;

@end
