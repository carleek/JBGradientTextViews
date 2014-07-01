//
//  JBGradientLabel.m
//  JBGradientTextViews
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import "JBGradientLabel.h"

@implementation JBGradientLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initPoints];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initPoints];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawGradientRect:rect];
    [super drawRect:rect];
}


@end
