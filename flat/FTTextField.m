//////////////////////////////////////////////////////////////////
//
//  FTTextField.m
//
//  Created by Dalton Cherry on 5/30/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "FTTextField.h"
#import "UIColor+BaseColor.h"

@implementation FTTextField

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
    self.borderWidth = 2.5;
    self.borderColor = [UIColor grayColor];
    self.selectedBorderColor = [UIColor hightlightColor];
    self.selectedTextColor = [UIColor blackColor];
    self.bodyColor = [UIColor whiteColor];
    
    self.disabledBorderColor = [UIColor grayColor];
    self.disabledBodyColor = [UIColor grayColor];
    self.disabledTextColor = [UIColor colorWithWhite:0.7 alpha:1];
}
//////////////////////////////////////////////////////////////////

@end
