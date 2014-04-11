//
//  SCGCircle.h
//  Squares
//
//  Created by Jeffery Moulds on 4/11/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCGCircleDelegate;

@interface SCGCircle : UIView

@property (nonatomic,assign) id<SCGCircleDelegate> delegate;

@property (nonatomic) CGPoint position;

@end

@protocol SCGCircleDelegate <NSObject>

- (UIColor *)circleTappedWithPosition:(CGPoint)position;

@end


