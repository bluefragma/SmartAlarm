//
//  RootViewController.m
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "SetupViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize infoButton;
@synthesize mainViewController;
@synthesize setupViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [infoButton release];
    [mainViewController release];
    [setupViewController release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 파일을 불러와 객체 생성
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.mainViewController = viewController;
    [viewController release];
    [self.view insertSubview:mainViewController.view belowSubview:infoButton];
}

-(void) loadSetupViewController
{
	SetupViewController *viewController = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
	self.setupViewController = viewController;
	[viewController release];
}

- (IBAction)setupClick
{
	if (setupViewController == nil) {
		[self loadSetupViewController];
	}
	
	UIView *mainView = mainViewController.view;
	UIView *setupView = setupViewController.view;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:([mainView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
	
	if ([mainView superview] != nil) {
        
		[mainView removeFromSuperview];
        [infoButton removeFromSuperview];
		[self.view addSubview:setupView];
        
	} else {
        [self AlarmSetting];
        
		[setupView removeFromSuperview];
        
		[self.view addSubview:mainView];
		[self.view insertSubview:infoButton aboveSubview:mainViewController.view];
	}
	[UIView commitAnimations];
}

-(void) AlarmSetting
{
    mainViewController.pAlarmOnOff = setupViewController.switchControl.on;
    
    if (mainViewController.pAlarmOnOff == YES)
    {
      	NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDate *date = [setupViewController.pDatePicker date];
        NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
        mainViewController.pAlarmHour = [comps hour];
        mainViewController.pAlarmMinute = [comps minute];
        [pCalendar release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
