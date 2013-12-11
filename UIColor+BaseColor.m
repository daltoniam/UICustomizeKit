//////////////////////////////////////////////////////////////////
//
//  BaseColor.m
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import "UIColor+BaseColor.h"

@implementation BaseColor

@end

@implementation UIColor (BaseColor)

//////////////////////////////////////////////////////////////////
-(UIColor*)adjustColor:(CGFloat)point
{
    NSInteger totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = totalComponents == 2 ? YES : NO;
    
    CGFloat* oldComponents = (CGFloat*)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale)
    {
        newComponents[0] = [self checkValue:oldComponents[0]+point point:point];
        newComponents[1] = [self checkValue:oldComponents[0]+point point:point];
        newComponents[2] = [self checkValue:oldComponents[0]+point point:point];
        newComponents[3] = oldComponents[1];
    }
    else
    {
        newComponents[0] = [self checkValue:oldComponents[0]+point point:point];
        newComponents[1] = [self checkValue:oldComponents[1]+point point:point];
        newComponents[2] = [self checkValue:oldComponents[2]+point point:point];
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}
//////////////////////////////////////////////////////////////////
-(CGFloat)checkValue:(CGFloat)current point:(CGFloat)point
{
    if(point < 0)
        return [self checkNeg:current];
    return [self checkPos:current];
}
//////////////////////////////////////////////////////////////////
-(CGFloat)checkPos:(CGFloat)current
{
    return current > 1.0 ? 1.0 : current;
}
//////////////////////////////////////////////////////////////////
-(CGFloat)checkNeg:(CGFloat)current
{
    return current < 0.0 ? 0.0 : current;
}
//////////////////////////////////////////////////////////////////
+ (UIColor*)colorFromHexCode:(NSString*)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3)
    {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6)
        cleanString = [cleanString stringByAppendingString:@"ff"];
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
//////////////////////////////////////////////////////////////////
//color categories
//////////////////////////////////////////////////////////////////
+(UIColor*)turquoiseColor{
    return [UIColor colorFromHexCode:@"1ABC9C"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)greenSeaColor{
    return [UIColor colorFromHexCode:@"16A085"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)emerlandColor{
    return [UIColor colorFromHexCode:@"2ECC71"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)nephritisColor {
    return [UIColor colorFromHexCode:@"27AE60"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)peterRiverColor {
    return [UIColor colorFromHexCode:@"3498DB"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)belizeHoleColor {
    return [UIColor colorFromHexCode:@"2980B9"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)amethystColor {
    return [UIColor colorFromHexCode:@"9B59B6"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)wisteriaColor {
    return [UIColor colorFromHexCode:@"8E44AD"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)wetAsphaltColor {
    return [UIColor colorFromHexCode:@"34495E"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)midnightBlueColor {
    return [UIColor colorFromHexCode:@"2C3E50"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)sunflowerColor {
    return [UIColor colorFromHexCode:@"F1C40F"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)tangerineColor {
    return [UIColor colorFromHexCode:@"F39C12"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)carrotColor {
    return [UIColor colorFromHexCode:@"E67E22"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)pumpkinColor {
    return [UIColor colorFromHexCode:@"D35400"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)alizarinColor {
    return [UIColor colorFromHexCode:@"E74C3C"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)pomegranateColor {
    return [UIColor colorFromHexCode:@"C0392B"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)cloudsColor {
    return [UIColor colorFromHexCode:@"ECF0F1"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)silverColor {
    return [UIColor colorFromHexCode:@"BDC3C7"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)concreteColor {
    return [UIColor colorFromHexCode:@"95A5A6"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)asbestosColor {
    return [UIColor colorFromHexCode:@"7F8C8D"];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)primaryColor {
    return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)infoColor {
    return [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)successColor {
    return [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)warningColor {
    return [UIColor colorWithRed:0.97f green:0.58f blue:0.02f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)dangerColor {
    return [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)inverseColor {
    return [UIColor colorWithRed:0.13f green:0.13f blue:0.13f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)hightlightColor {
    return [UIColor colorWithRed:0/255.0f green:136/255.0f blue:204/255.0f alpha:1];
}
//////////////////////////////////////////////////////////////////
+(UIColor*)baseColor {
    return [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1];
}
//////////////////////////////////////////////////////////////////

@end
