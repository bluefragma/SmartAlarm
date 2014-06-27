//
//  RootViewController.h
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class SetupViewController;

@interface RootViewController : UIViewController {
    IBOutlet UIButton *infoButton;  // 알람 설정 전환 버튼
    MainViewController *mainViewController; // MainViewController 참조 객체
    SetupViewController *setupViewController;   // SetupViewController 참조 객체
}

@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) SetupViewController *setupViewController;

-(IBAction)setupClick;  // 화면 전환시 호출
-(void) AlarmSetting;   // 알람 시간 설정

@end
