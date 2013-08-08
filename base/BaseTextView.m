//////////////////////////////////////////////////////////////////
//
//  BaseTextView.m
//
//  Created by Dalton Cherry on 8/8/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "BaseTextView.h"

@interface TextViewDelegate : NSObject <UITextViewDelegate> {
@public
    id<UITextViewDelegate> _userDelegate;
}
@end

@interface BaseTextView ()

@property(nonatomic,strong)TextViewDelegate* myDelegate;

@end

@implementation BaseTextView

//////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.myDelegate = [[TextViewDelegate alloc] init];
        self.myDelegate->_userDelegate = nil;
        self.padding = 1.5;
        self.rounding = 3;
        //self.enabled = YES;
        self.bodyColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        [self updateFrame:frame];
        self.returnKeyType = UIReturnKeyDone;
        self.delegate = self.myDelegate;
        [self performSelector:@selector(firstSetup) withObject:nil afterDelay:0.01];
    }
    return self;
}
//////////////////////////////////////////////////////////////////
-(void)firstSetup
{
    [self updateState:textStateNormal];
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
    //placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.padding, self.padding,
    //                                                             self.frame.size.width-(self.padding*2), -(self.padding*2))];
}
//////////////////////////////////////////////////////////////////
-(void)setPadding:(CGFloat)padding
{
    _padding = padding;
    self.contentInset = UIEdgeInsetsMake(padding, padding, padding, padding);
}
//////////////////////////////////////////////////////////////////
/*-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if(!placeHolderLabel)
    {
        placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.padding, self.padding,
                                                                     self.frame.size.width-(self.padding*2), -(self.padding*2))];
        placeHolderLabel.backgroundColor = [UIColor clearColor];
        //placeHolderLabel.textColor = [UIColor lightGrayColor];
        placeHolderLabel.text = placeholder;
        [self addSubview:placeHolderLabel];
    }
}*/
//////////////////////////////////////////////////////////////////
- (void)setDelegate:(id<UITextViewDelegate>)delegate
{
    if(delegate != self.myDelegate)
        self.myDelegate->_userDelegate = delegate;
    super.delegate = nil;
    super.delegate = (id)self.myDelegate;
}
//////////////////////////////////////////////////////////////////
- (id<UITextViewDelegate>)delegate
{
    return self.myDelegate;
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
    self.backgroundColor = body;
    self.layer.cornerRadius = self.rounding;
    self.layer.borderColor = border.CGColor;
    self.layer.borderWidth = self.borderWidth;
    //self.background = [UIImage imageWithBorder:border bodyColor:body width:self.borderWidth cornerRadius:self.rounding];
    //self.disabledBackground = [UIImage imageWithBorder:border bodyColor:body width:self.borderWidth cornerRadius:self.rounding];
}
//////////////////////////////////////////////////////////////////
-(void)setEditable:(BOOL)editable
{
    [super setEditable:editable];
    if(editable)
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

@implementation TextViewDelegate

//////////////////////////////////////////////////////////////////
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [(BaseTextView*)textView updateState:textStateSelected];
    if([_userDelegate respondsToSelector:@selector(textViewDidBeginEditing:)])
        [_userDelegate textViewDidBeginEditing:textView];
}
//////////////////////////////////////////////////////////////////
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [(BaseTextView*)textView updateState:textStateNormal];
    if([_userDelegate respondsToSelector:@selector(textViewDidEndEditing:)])
        [_userDelegate textViewDidEndEditing:textView];
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
