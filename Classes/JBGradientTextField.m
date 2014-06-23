//
//  JBGradientTextField.m
//  JBGradientTextViews
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import "JBGradientTextField.h"

@implementation JBGradientTextField

-(void)initPoints{
    self.startPoint = CGPointMake(-1, -1);
    self.endPoint = CGPointMake(-1, -1);
    self.startCenter = CGPointMake(-1, -1);
    self.endCenter = CGPointMake(-1, -1);
    self.options = 0;
    
}
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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:[self.gradientColors count]];
    [self.gradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIColor class]]) {
            [colors addObject:(__bridge id)[obj CGColor]];
        } else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
            [colors addObject:obj];
        } else {
            @throw [NSException exceptionWithName:@"JBGradientError"
                                           reason:@"Object in gradientColors array is not a UIColor or CGColorRef"
                                         userInfo:NULL];
        }
    }];
    
    // Initialize the locations or take the users point objects and turn them into c array
    NSUInteger numLocations = colors.count;
    CGFloat *locations = malloc(numLocations * sizeof(float));
    if (self.gradientLocations) {
        if (self.gradientLocations.count!=numLocations) {
            @throw [NSException exceptionWithName:@"JBGradientError"
                                           reason:@"Number of locations inside gradientLocations does not match number of gradient colors!"
                                         userInfo:NULL];
        }else{
            [self.gradientLocations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                if ([obj isKindOfClass:[NSNumber class]]) {
                    locations[idx] = ((NSNumber *)obj).floatValue;
                }else{
                    @throw [NSException exceptionWithName:@"JBGradientError"
                                                   reason:@"Object in gradientLocations is not a NSNumber!"
                                                 userInfo:NULL];
                    
                }
            }];
            
        }
    }else{
        locations[0] = 0.0f;
        for (int i=1; i<numLocations; i++) {
            locations[i] = locations[i-1]+ 1.0/(float)(numLocations-1);
        }
    }
    
    
    // Set up the gradient
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    
    CGContextAddRect(context, rect);
    CGContextClip(context);
    
    if (self.gradientType==kLinearGradientType) {
        
        
        CGPoint startPoint;
        if (self.startPoint.x==-1) {
            startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
        }else{
            startPoint = self.startPoint;
        }
        
        CGPoint endPoint;
        if (self.startPoint.x==-1) {
            endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
        }else{
            startPoint = self.endPoint;
        }
        
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, self.options);
    }else{
        
        CGPoint startCenter, endCenter;
        CGFloat startRadius, endRadius;
        
        if (self.startCenter.x==-1 && self.endCenter.x==-1) {
            if (CGRectGetMaxY(rect)>CGRectGetMaxX(rect)) {
                startCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                startRadius = CGRectGetMidY(rect);
                endCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                endRadius = 0;
                
            }else{
                startCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                startRadius = CGRectGetMidX(rect);
                endCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                endRadius = 0;
            }
            
        }else{
            
            if (self.startCenter.x==-1) {
                startCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                startRadius = CGRectGetMidX(rect);
                
            }else{
                startCenter = self.startCenter;
                startRadius = self.startRadius;
                
            }
            
            if (self.endCenter.x==-1) {
                endCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
                endRadius = CGRectGetMaxX(rect);
            }else{
                endCenter = self.endCenter;
                endRadius = self.endRadius;
            }
        }
        CGContextDrawRadialGradient(context, gradient, startCenter, startRadius, endCenter, endRadius, self.options);
    }
    
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(context);    
    [super drawRect:rect];
}



@end
