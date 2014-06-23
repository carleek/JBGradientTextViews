//
//  JBGradientLabel.h
//  JBGradientTextViews
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientType.h"

@interface JBGradientLabel : UILabel
@property (nonatomic, assign) JBGradientType gradientType;

@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, strong) NSArray *gradientLocations;
@property (nonatomic, assign) CGGradientDrawingOptions options;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

@property (nonatomic, assign) CGPoint startCenter;
@property (nonatomic, assign) CGFloat startRadius;
@property (nonatomic, assign) CGPoint endCenter;
@property (nonatomic, assign) CGFloat endRadius;

@end
