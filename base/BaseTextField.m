//////////////////////////////////////////////////////////////////
//
//  BaseTextField.m
//
//  Created by Dalton Cherry on 5/30/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseTextField.h"
#import "UIImage+BaseImage.h"
#import "UIColor+BaseColor.h"

@interface TextFieldDelegate : NSObject <UITextFieldDelegate> {
@public
    id<UITextFieldDelegate> _userDelegate;
}
@end

@interface BaseTextField ()

@property(nonatomic,strong)TextFieldDelegate* myDelegate;

@end

@implementation BaseTextField

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.myDelegate = [[TextFieldDelegate alloc] init];
        self.padding = 6;
        self.rounding = 3;
        self.enabled = YES;
        self.bodyColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        [self updateFrame:frame];
        self.returnKeyType = UIReturnKeyDone;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.delegate = self.myDelegate;
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self updateFrame:frame];
}
//////////////////////////////////////////////////////////////////
-(void)updateFrame:(CGRect)frame
{
    if(!self.leftView)
    {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.padding, frame.size.height)];
        self.leftView = paddingView;
        self.rightView = paddingView;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    else
        self.leftView.frame = CGRectMake(0, 0, self.padding, frame.size.height);
    [self updateState:textStateNormal];
}
//////////////////////////////////////////////////////////////////
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    self.myDelegate->_userDelegate = delegate;
    super.delegate = nil;
    super.delegate = (id)self.myDelegate;
}
//////////////////////////////////////////////////////////////////
- (id<UITextFieldDelegate>)delegate
{
    return self.myDelegate->_userDelegate;
}
//////////////////////////////////////////////////////////////////
-(void)layoutSubviews
{
    [super layoutSubviews];
}
//////////////////////////////////////////////////////////////////
-(void)updateState:(textState)state
{
    UIColor* textColor = self.textColor;
    UIColor* border = self.borderColor;
    UIColor* body = self.bodyColor;
    if(state == textStateNormal)
    {
        textColor = self.textColor;
    }
    else if(state == textStateDisabled)
    {
        textColor = self.disabledTextColor;
        border = self.disabledBorderColor;
        body = self.disabledBodyColor;
    }
    else if(state == textStateSelected)
    {
        textColor = self.selectedTextColor;
        border = self.selectedBorderColor;
        body = self.selectedBodyColor;
    }
    if(!body)
        body = self.bodyColor;
    if(!textColor)
        textColor = self.textColor;
    if(!border)
        border = self.borderColor;
    
    self.textColor = textColor;
    //if(self.enabled)
        self.background = [UIImage imageWithBorder:border bodyColor:body width:self.borderWidth cornerRadius:self.rounding];
    //else
        self.disabledBackground = [UIImage imageWithBorder:border bodyColor:body width:self.borderWidth cornerRadius:self.rounding];
}
//////////////////////////////////////////////////////////////////
-(void)setEnabled:(BOOL)enable
{
    [super setEnabled:enable];
    if(enable)
        [self updateState:textStateNormal];
    else
        [self updateState:textStateDisabled];
}
//////////////////////////////////////////////////////////////////

@end

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

@implementation TextFieldDelegate

//////////////////////////////////////////////////////////////////
- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    [(BaseTextField*)textField updateState:textStateSelected];
    if([_userDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
        [_userDelegate textFieldDidBeginEditing:textField];
}
//////////////////////////////////////////////////////////////////
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [(BaseTextField*)textField updateState:textStateNormal];
    if([_userDelegate respondsToSelector:@selector(textFieldDidEndEditing:)])
        [_userDelegate textFieldDidEndEditing:textField];
}
//////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([_userDelegate respondsToSelector:@selector(textFieldShouldReturn:)])
        return [_userDelegate textFieldShouldReturn:textField];
    [textField resignFirstResponder];
    return YES;
}
//////////////////////////////////////////////////////////////////
- (BOOL)respondsToSelector:(SEL)selector
{
    return [_userDelegate respondsToSelector:selector] || [super respondsToSelector:selector];
}
//////////////////////////////////////////////////////////////////
- (void)forwardInvocation:(NSInvocation *)invocation {
    // This should only ever be called from 'UITextField', after it has verified
    // that 'localDelegate' responds to the selector by sending me
    // 'respondsToSelector:'.  So I don't need to check again here.
    [invocation invokeWithTarget:_userDelegate];
}

@end
