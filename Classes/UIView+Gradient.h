//
//  UIView+Gradient.h
//  GradientTest
//
//  Created by Joshua Bryson on 6/30/14.
//  Copyright (c) 2014 QuickworkAppsLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef GradientType
#define GradientType
typedef enum{
    kLinearGradientType=0,
    kRadialGradientType
}JBGradientType;
#endif

@interface UIView (Gradient)


@property (nonatomic, assign) JBGradientType gradientType;

@property (nonatomic, copy) NSArray *gradientColors;
@property (nonatomic, copy) NSArray *gradientLocations;
@property (nonatomic, assign) CGGradientDrawingOptions options;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint startCenter;
@property (nonatomic, assign) CGFloat startRadius;
@property (nonatomic, assign) CGPoint endCenter;
@property (nonatomic, assign) CGFloat endRadius;

-(void)drawGradientRect:(CGRect)rect;
-(void)initPoints;

@end
