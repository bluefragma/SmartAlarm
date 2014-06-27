//
//  SetupViewController.m
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "SetupViewController.h"

@interface  SetupViewController ()

@end

@implementation SetupViewController
@synthesize pDatePicker;
@synthesize switchControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDate *currentDate = [NSDate date];
    NSDate *datePlusOneMinute = [currentDate dateByAddingTimeInterval:60];
    pDatePicker.date = datePlusOneMinute;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
