//
//  BaseActivityViewTests.m
//  UICustomizeKit
//
//  Created by Austin Cherry on 1/14/14.
//  Copyright (c) 2014 Basement Krew. All rights reserved.
//

#import "BaseActivityView.h"
#import "Kiwi.h"

SPEC_BEGIN(BaseActivityViewSpec)

describe(@"BaseActivityView", ^{
    it(@"Should be 42", ^{
        [[theValue(42) should] equal:theValue(42)];
    });
});
SPEC_END
