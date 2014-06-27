//
//  SetupViewController.h
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController {
    IBOutlet UIDatePicker *pDatePicker;
    IBOutlet UISwitch *switchControl;
}

@property (nonatomic, strong) IBOutlet UIDatePicker *pDatePicker;
@property (nonatomic, strong) IBOutlet UISwitch *switchControl;

@end
