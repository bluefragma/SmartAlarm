//
//  MainClockView.m
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "MainClockView.h"

#define SECOND_WIDTH		60
#define MINUTE_WIDTH		60
#define HOUR_WIDTH			45

@implementation MainClockView
@synthesize pHour;
@synthesize pMinute;
@synthesize pSecond;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    UIImage *img = [UIImage imageNamed:@"clock.png"];
    imgClock = CGImageRetain(img.CGImage);
    [img release];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawClockBitmap:context];
    [self drawLine:context];
}

- (void) drawLine:(CGContextRef)context
{
    int centerX = self.bounds.size.width / 2;
    int centerY = self.bounds.size.height / 2;
    
    [self DrawSecond:context CenterX:centerX CenterY:centerY];
    [self DrawMinute:context CenterX:centerX CenterY:centerY];
    [self DrawHour:context CenterX:centerX CenterY:centerY];
}

- (void) drawClockBitmap:(CGContextRef)context
{
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	CGContextClipToRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
	CGContextDrawImage(context, CGRectMake(0,0,CGImageGetWidth(imgClock), CGImageGetHeight(imgClock)), imgClock);
	CGContextRestoreGState(context);
}

-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY
{
    int newX, newY;
	newX = (int)(sin(pSecond * 6 * 3.14/180 ) * SECOND_WIDTH + pCenterX);
	newY = (int)(CenterY - (cos(pSecond * 6 * 3.14/180 ) * SECOND_WIDTH ) );
	CGContextSetRGBStrokeColor(context, 255, 0, 0, 1.0);
	CGContextSetLineWidth(context, 2.0);
	CGContextMoveToPoint(context, pCenterX, CenterY);
	CGContextAddLineToPoint(context, newX, newY);
    
	CGContextStrokePath(context);
}

- (void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY
{
    int newX, newY;
    newX = (int)(sin(pMinute * 6 * 3.14/180) * MINUTE_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pMinute * 6 * 3.14/180) * MINUTE_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextSetLineWidth(context, 5.0);
    CGContextMoveToPoint(context, pCenterX, CenterY);
    CGContextAddLineToPoint(context, newX, newY);
    CGContextStrokePath(context);
}

- (void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY
{
    int newX, newY;
    newX = (int)(sin(pHour * 30 * 3.14/180) * HOUR_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pHour * 30 * 3.14/180) * HOUR_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextSetLineWidth(context, 6.0);
    CGContextMoveToPoint(context, pCenterX, CenterY);
    CGContextAddLineToPoint(context, newX, newY);
    CGContextStrokePath(context);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
