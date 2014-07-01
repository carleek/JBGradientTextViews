//
//  UIView+Gradient.m
//  GradientTest
//
//  Created by Joshua Bryson on 6/30/14.
//  Copyright (c) 2014 QuickworkAppsLLC. All rights reserved.
//

#import "UIView+Gradient.h"
#import <objc/runtime.h>


NSString *const typeKey = @"kTypeKey";
NSString *const colorsKey = @"kColorsKey";
NSString *const locationsKey = @"kLocationsKey";
NSString *const optionsKey = @"kOptionsKey";
NSString *const startPointKey = @"kStartPointKey";
NSString *const endPointKey = @"kGEndPointKey";
NSString *const startCenterKey = @"kStartCenterKey";
NSString *const endCenterKey = @"kEndCenterKey";
NSString *const startRadiusKey = @"kStartRadiusKey";
NSString *const endRadiusKey = @"kEndRadiusKey";

@implementation UIView (Gradient)

#pragma mark - Getters and Setters
-(void)setGradientType:(JBGradientType)gradientType{
    objc_setAssociatedObject(self, (__bridge const void *)(typeKey), [NSNumber numberWithInt:gradientType], OBJC_ASSOCIATION_COPY);
}
-(JBGradientType)gradientType{
    return ((NSNumber *)objc_getAssociatedObject(self, (__bridge const void *)(typeKey))).intValue;
}

-(void)setGradientColors:(NSArray *)gradientColors{
    objc_setAssociatedObject(self, (__bridge const void *)(colorsKey), gradientColors, OBJC_ASSOCIATION_COPY);
}
-(NSArray *)gradientColors{
    NSArray *colors =  objc_getAssociatedObject(self, (__bridge const void *)(colorsKey));
    return colors;
}

-(void)setGradientLocations:(NSArray *)gradientLocations{
   objc_setAssociatedObject(self, (__bridge const void *)(locationsKey), gradientLocations, OBJC_ASSOCIATION_COPY);
}
-(NSArray *)gradientLocations{
    return objc_getAssociatedObject(self, (__bridge const void *)(locationsKey));
}

-(void)setOptions:(CGGradientDrawingOptions)options{
   objc_setAssociatedObject(self, (__bridge const void *)(optionsKey), [NSNumber numberWithInt:options], OBJC_ASSOCIATION_COPY);
}
-(CGGradientDrawingOptions)options{
    return ((NSNumber *)objc_getAssociatedObject(self, (__bridge const void *)(typeKey))).intValue;
}

-(void)setStartPoint:(CGPoint)startPoint{
     objc_setAssociatedObject(self, (__bridge const void *)(startPointKey), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_COPY);
}
-(CGPoint)startPoint{
    return ((NSValue *)objc_getAssociatedObject(self, (__bridge const void *)(startPointKey))).CGPointValue;
}

-(void)setEndPoint:(CGPoint)endPoint{
    objc_setAssociatedObject(self, (__bridge const void *)(endPointKey), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_COPY);
    
}
-(CGPoint)endPoint{
    return ((NSValue *)objc_getAssociatedObject(self, (__bridge const void *)(endPointKey))).CGPointValue;
}

-(void)setStartCenter:(CGPoint)startCenter{
     objc_setAssociatedObject(self, (__bridge const void *)(startCenterKey), [NSValue valueWithCGPoint:startCenter], OBJC_ASSOCIATION_COPY);
}
-(CGPoint)startCenter{
    return ((NSValue *)objc_getAssociatedObject(self, (__bridge const void *)(endPointKey))).CGPointValue;
}

-(void)setEndCenter:(CGPoint)endCenter{
     objc_setAssociatedObject(self, (__bridge const void *)(endCenterKey), [NSValue valueWithCGPoint:endCenter], OBJC_ASSOCIATION_COPY);
}
-(CGPoint)endCenter{
    return ((NSValue *)objc_getAssociatedObject(self, (__bridge const void *)(endPointKey))).CGPointValue;
}

-(void)setStartRadius:(CGFloat)startRadius{
     objc_setAssociatedObject(self, (__bridge const void *)(startRadiusKey), [NSNumber numberWithFloat:startRadius], OBJC_ASSOCIATION_COPY);
}
-(CGFloat)startRadius{
    return ((NSNumber *)objc_getAssociatedObject(self, (__bridge const void *)(startRadiusKey))).floatValue;
}

-(void)setEndRadius:(CGFloat)endRadius{
     objc_setAssociatedObject(self, (__bridge const void *)(endRadiusKey), [NSNumber numberWithFloat:endRadius], OBJC_ASSOCIATION_COPY);
}
-(CGFloat)endRadius{
      return ((NSNumber *)objc_getAssociatedObject(self, (__bridge const void *)(endRadiusKey))).floatValue;
}

#pragma mark - Methods
-(void)initPoints{
    self.startPoint = CGPointMake(-1, -1);
    self.endPoint = CGPointMake(-1, -1);
    self.startCenter = CGPointMake(-1, -1);
    self.endCenter = CGPointMake(-1, -1);
    self.options = 0;
    
}

-(NSArray *)getConvertedGradientColors{
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
    return colors;
}

- (void)drawRadialGradient:(CGRect)rect gradient:(CGGradientRef)gradient context:(CGContextRef)context
{
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

- (void)drawLinearGradient:(CGRect)rect gradient:(CGGradientRef)gradient context:(CGContextRef)context
{
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
}

-(CGFloat *)getLocations:(NSUInteger) numLocations{
//    NSUInteger numLocations = colors.count;
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
    return locations;
}

- (void)drawGradientRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *colors =  [self getConvertedGradientColors];
    
    // Initialize the locations or take the users point objects and turn them into c array
    CGFloat *locations = [self getLocations:colors.count];
    
    // Set up the gradient
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    
    CGContextAddRect(context, rect);
    CGContextClip(context);
    
    if (self.gradientType==kLinearGradientType) {
        [self drawLinearGradient:rect gradient:gradient context:context];
    }else{
        [self drawRadialGradient:rect gradient:gradient context:context];
    }
    
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(context);
}


@end
