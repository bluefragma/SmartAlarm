//
//  MainClockView.h
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainClockView : UIView {
    CGImageRef imgClock;
    int pHour;
    int pMinute;
    int pSecond;
}

- (void) drawLine:(CGContextRef)context;
- (void) drawClockBitmap:(CGContextRef)context;
- (void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;
- (void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;
- (void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;

@property int pHour;
@property int pMinute;
@property int pSecond;

@end
