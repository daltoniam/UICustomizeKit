//////////////////////////////////////////////////////////////////
//
//  BTTextView.m
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BTTextView.h"
#import "UIColor+BaseColor.h"

@implementation BTTextView

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self sharedInit];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)sharedInit
{
    self.mainTextColor = [UIColor grayColor];
    self.borderWidth = 1;
    self.borderColor = [UIColor grayColor];
    self.selectedBorderColor = [UIColor hightlightColor];
    self.selectedTextColor = [UIColor grayColor];
    self.bodyColor = [UIColor whiteColor];
    
    self.disabledBorderColor = [UIColor grayColor];
    self.disabledBodyColor = [UIColor grayColor];
    self.disabledTextColor = [UIColor colorWithWhite:0.7 alpha:1];
}
//////////////////////////////////////////////////////////////////

@end
