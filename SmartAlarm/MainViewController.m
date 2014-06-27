//
//  MainViewController.m
//  SmartAlarm
//
//  Created by 양동길 on 2014. 6. 24..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "MainViewController.h"
#import "MainClockView.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize pAlarmOnOff;
@synthesize pAlarmHour;
@synthesize pAlarmMinute;

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
    
    pAlarmOnOff = NO;
    [self onTimer];
 	timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    skimHand.hidden = YES;
    [self performSelector:@selector(skimStep1) withObject:nil afterDelay:0.5];
    [self performSelector:@selector(skimStep2) withObject:nil afterDelay:0.5+1.3];
    [self performSelector:@selector(skimStep3) withObject:nil afterDelay:0.5+1.3+0.5];
}

-(void)skimStep1
{
    skimHand.hidden = NO;
    skimHand.center = CGPointMake(-58, skimHand.center.y);
    
    [UIView animateWithDuration:0.8 delay: 0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         skimHand.center = CGPointMake(38+38/2, skimHand.center.y);
                     } completion:^(BOOL finished){
                         skimHand.image = [UIImage imageNamed:@"Hand.png"];
                     }];
}

-(void)skimStep2
{
    skimHand.image = [UIImage imageNamed:@"HandGrab.png"];
}

-(void)skimStep3
{
    [UIView animateWithDuration:1.0 delay: 0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         skimHand.center = CGPointMake(skimHand.center.x+330, skimHand.center.y);
                         pClockView.center = CGPointMake(pClockView.center.x+320, pClockView.center.y);
                     } completion:^(BOOL finished){
                         skimHand.hidden = YES;
                         pClockView.hidden = YES;
                     }];
}

- (void) onTimer {
    int phour, pminute, psecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

	NSDate *date = [NSDate date];
	NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
	phour = [comps hour];
	pminute = [comps minute];
	psecond = [comps second];
	clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d",phour, pminute, psecond];
    
    pClockView.pHour = phour;
    pClockView.pMinute = pminute;
    
    pClockView.pSecond = psecond;
    
    [pClockView setNeedsDisplay];
    
    if (pAlarmOnOff == YES)
        if (pAlarmHour == phour && pAlarmMinute == pminute && psecond == 0)
            [self messageDisplay];
    [pCalendar release];
}

- (void) messageDisplay {
    UIAlertView *AlrmView = [[UIAlertView alloc] initWithTitle:@"알람 시계"
                                                       message:@"약속시간입니다."
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil];
    [AlrmView show];
    [AlrmView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [skimHand release];
    [super dealloc];
}
@end
