//////////////////////////////////////////////////////////////////
//
//  BaseColor.h
//
//  Created by Dalton Cherry on 5/27/13.
//  Copyright (c) 2013 basement Krew. All rights reserved.
//
//////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@interface BaseColor : UIColor

@end

/**
 Provides category methods for UIColor.
 */
@interface UIColor (BaseColor)

///-------------------------------
/// @name Category Methods.
///-------------------------------

/**
 Adjust the color by a point value (up or down)
 */
-(UIColor*)adjustColor:(CGFloat)point;

///-------------------------------
/// @name Extra Colors!
///-------------------------------

+(UIColor*)turquoiseColor;
+(UIColor*)greenSeaColor;
+(UIColor*)emerlandColor;
+(UIColor*)nephritisColor;
+(UIColor*)peterRiverColor;
+(UIColor*)belizeHoleColor;
+(UIColor*)amethystColor;
+(UIColor*)wisteriaColor;
+(UIColor*)wetAsphaltColor;
+(UIColor*)midnightBlueColor;
+(UIColor*)sunflowerColor;
+(UIColor*)tangerineColor;
+(UIColor*)carrotColor;
+(UIColor*)pumpkinColor;
+(UIColor*)alizarinColor;
+(UIColor*)pomegranateColor;
+(UIColor*)cloudsColor;
+(UIColor*)silverColor;
+(UIColor*)concreteColor;
+(UIColor*)asbestosColor;
+(UIColor*)primaryColor;
+(UIColor*)infoColor;
+(UIColor*)successColor;
+(UIColor*)warningColor;
+(UIColor*)dangerColor;
+(UIColor*)inverseColor;
+(UIColor*)hightlightColor;
+(UIColor*)baseColor;

@end