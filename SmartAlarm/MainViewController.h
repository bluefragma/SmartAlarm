//
//  MainViewController.h
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainClockView;

@interface MainViewController : UIViewController {
    NSTimer *timer;

    IBOutlet UILabel *clockDisplay;
    IBOutlet MainClockView *pClockView;
    IBOutlet UIImageView *skimHand;
    
    BOOL pAlarmOnOff;
    int pAlarmHour, pAlarmMinute;
}

- (void) onTimer;
- (void) messageDisplay;

@property BOOL pAlarmOnOff;
@property int pAlarmHour;
@property int pAlarmMinute;

@end
