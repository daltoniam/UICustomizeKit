//////////////////////////////////////////////////////////////////
//
//  UIBarButtonItem+BaseStyle.h
//
//  Created by Dalton Cherry on 6/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BaseStyle)

-(void)setFont:(UIFont*)font;
+(void)setFont:(UIFont*)font;
+(void)setFont:(UIFont*)font whenContainedIn:(Class <UIAppearanceContainer>)containerClass, ...;
+(NSMutableDictionary*)titleTextAttribs:(id)appearance forState:(UIControlState)state;

@end
