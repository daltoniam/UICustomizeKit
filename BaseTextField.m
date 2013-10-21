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
        self.myDelegate->_userDelegate = nil;
        self.padding = 6;
        self.rounding = 3;
        self.bodyColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        [self updateFrame:frame];
        self.returnKeyType = UIReturnKeyDone;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.delegate = self.myDelegate;
        [self performSelector:@selector(firstSetup) withObject:nil afterDelay:0.01];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)firstSetup
{
    if(self.enabled)
        [self updateState:textStateNormal];
    else
        [self updateState:textStateDisabled];
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
}
//////////////////////////////////////////////////////////////////
- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    if(delegate != self.myDelegate)
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
-(void)updateState:(textState)state
{
    UIColor* txtColor = self.mainTextColor;
    UIColor* border = self.borderColor;
    UIColor* body = self.bodyColor;
    if(state == textStateNormal)
    {
        txtColor = self.mainTextColor;
    }
    else if(state == textStateDisabled)
    {
        txtColor = self.disabledTextColor;
        border = self.disabledBorderColor;
        body = self.disabledBodyColor;
    }
    else if(state == textStateSelected)
    {
        txtColor = self.selectedTextColor;
        border = self.selectedBorderColor;
        body = self.selectedBodyColor;
    }
    if(!body)
        body = self.bodyColor;
    if(!txtColor)
        txtColor = self.mainTextColor;
    if(!border)
        border = self.borderColor;
    
    self.textColor = txtColor;
    float size = self.borderWidth+1;
    self.background = [[UIImage imageWithBorder:border bodyColor:body width:self.borderWidth*2 cornerRadius:self.rounding] resizableImageWithCapInsets:UIEdgeInsetsMake(size,size,size,size)];
    self.disabledBackground = [[UIImage imageWithBorder:border bodyColor:body width:self.borderWidth*2 cornerRadius:self.rounding] resizableImageWithCapInsets:UIEdgeInsetsMake(size,size,size,size)];
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
-(void)textFieldDidBecomeFirstResponder:(id)textField
{
    //not sure why I had to implement this...., but will crash if I do not, more investigation is needed.
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
