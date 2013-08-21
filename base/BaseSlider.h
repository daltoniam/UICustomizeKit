//
//  BaseSlider.h
//  iOSTester
//
//  Created by Dalton Cherry on 8/21/13.
//  Copyright (c) 2013 Lightspeed Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSlider : UISlider

//the color of the fill part of the slider
@property(nonatomic,strong)NSArray* colors;

//the float fill gradient of the fill part of the slider
@property(nonatomic,assign)CGFloat* colorRange;

//your background/track color
@property(nonatomic,strong)NSArray* trackColors;

//the float background/track gradient
@property(nonatomic,assign)CGFloat* trackRange;

//the thumb colors
@property(nonatomic,strong)NSArray* thumbColors;

//the float fill gradient of the thumb
@property(nonatomic,assign)CGFloat* thumbRange;

//the selected thumb colors
@property(nonatomic,strong)NSArray* thumbSelectedColors;

//the selected float fill gradient of the thumb
@property(nonatomic,assign)CGFloat* thumbSelectedRange;

@end
