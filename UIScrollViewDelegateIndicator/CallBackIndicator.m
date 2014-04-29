//
//  CallBackIndicator.m
//  UIScrollViewDelegateExample
//
//  Created by Naoyuki Takura on 2014/04/29.
//  Copyright (c) 2014年 Naoyuki Takura. All rights reserved.
//

#import "CallBackIndicator.h"
#import <QuartzCore/QuartzCore.h>

@interface CallBackIndicator() {
}

@end

@implementation CallBackIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self showIndicator];
    }
    return self;
}

/**
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextStrokeEllipseInRect(context, CGRectMake(1, 1, 28, 28));
}
**/


- (void)showIndicator {
    
//    self.layer.backgroundColor = [UIColor grayColor].CGColor;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();

    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, 25, 25));
    
    layer.path = path;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [self.tintColor CGColor];
    
    [self.layer addSublayer:layer];
    
    CGPathRelease(path);
    
}

- (void)highlight {
    NSArray *layers = self.layer.sublayers;
    CAShapeLayer *layer = layers[0];

    //animation1(fill color)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        animation.duration = 0.3f;
        animation.fromValue = (__bridge id)(layer.fillColor);
        animation.toValue = (__bridge id)self.tintColor.CGColor;
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [layer addAnimation:animation forKey:@"fillAnimation1"];
    }
    
    //animation2(scale)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration = 0.3f;
        animation.fromValue = @1.0f;
        animation.toValue = @1.5f;
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [self.layer addAnimation:animation forKey:@"highlightScale1"];
        self.layer.affineTransform = CGAffineTransformMakeScale(1.3f, 1.3f);
    }
    
    //animation3(scale)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration = 0.6f;
        animation.fromValue = @1.5f;
        animation.toValue = @1.0f;
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [self.layer addAnimation:animation forKey:@"highlightScale2"];
        self.layer.affineTransform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }
    //animation4(fill color)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        animation.duration = 1.0f;
        animation.fromValue = (__bridge id)self.tintColor.CGColor;
        animation.toValue = (__bridge id)[UIColor clearColor].CGColor;
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [layer addAnimation:animation forKey:@"fillAnimation2"];
        layer.fillColor = [UIColor clearColor].CGColor;
    }

}

- (void)unHighlight {
    NSArray *layers = self.layer.sublayers;
    CAShapeLayer *layer = layers[0];
    layer.fillColor = [UIColor clearColor].CGColor;

}


@end
