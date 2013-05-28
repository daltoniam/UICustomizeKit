//////////////////////////////////////////////////////////////////
//
//  BTProgressView.h
//
//  Created by Dalton Cherry on 5/28/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseProgressView.h"

@interface BTProgressView : BaseProgressView


-(void)setColor:(UIColor*)color;

//create a progressBar
+(BTProgressView*)progressViewWithColor:(UIColor*)color;

@end
