//
//  CheckInViewController.m
//  TimeTracker
//
//  Created by Jimson Vedua on 6/10/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "CheckInViewController.h"
#import "Visit.h"
#import "TableViewController.h"

@interface CheckInViewController ()

@end

@implementation CheckInViewController

BOOL toggleButton;
NSDate *startTime;
NSString *startTimeString;
NSDate *endTime;
NSString *endTimeString;
BOOL ifWorkBool;
NSTimeInterval duration;
NSString *durationString;
Visit *currentVisit;
int buttonPressCount;


- (void)viewDidLoad {
    
//# 1 initiate the loading page
    [self toggleButtonStatusChange:YES];
    [super viewDidLoad];
    buttonPressCount = 0;
    currentVisit = [[Visit alloc]init];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//# 2.1 time capture, generate startTimeString.
- (IBAction)checkInButton:(id)sender {
    buttonPressCount ++;
    
    if (buttonPressCount == 1){
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
        NSLog(@"Check In Button Pressed");
        NSDate * now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *newDateString = [outputFormatter stringFromDate:now];
        NSLog(@"newDateString the current time is  %@", newDateString);
        startTime = now;
        startTimeString = newDateString;

    //3 show start time at label
        _startTimeTextfield.text = startTimeString;
        
    //# 2.2 button change to check out
        [self toggleButtonStatusChange:NO];
            [self ifWorkAlert];
    }
    
    
//#6 end time capture
    if (buttonPressCount == 2) {
        NSLog(@"button press count is %d________________",buttonPressCount);
        NSDate * now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *newDateString = [outputFormatter stringFromDate:now];
        NSLog(@"newDateString the current time is  %@", newDateString);
        
        endTime = now;
        endTimeString = newDateString;

//#7 calculate duration
        currentVisit.startTime = startTime;
        currentVisit.endTime = endTime;
        currentVisit.startTimeString = startTimeString;
        currentVisit.endTimeString = endTimeString;
        currentVisit.ifWorkVisit = ifWorkBool;
        
        
        duration = [endTime timeIntervalSinceDate: startTime];
        NSLog(@"%f",duration);
        currentVisit.duration = duration;
        
        
        NSInteger ti = duration;
        NSInteger seconds = ti % 60;
        NSInteger minutes = (ti / 60) % 60;
        NSInteger hours = (ti / 3600);
        durationString = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
        currentVisit.durationString = durationString;
        

        NSLog(@"%@+++++++++++++++++++++++",currentVisit.durationString);
    }
    [self showEndTimeAndOhters];
    
}



//#8 show data
-(void)showEndTimeAndOhters{
    _endTimeTextfield.text = endTimeString;
    _workOrFamilyTextfield.text = ifWorkBool ? @"work visit":@"family time";
    _durationTextfield.text = durationString;
}

//#4  popout "work" or "family"?
- (void) ifWorkAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"What is the visit type?"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Work Visit"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              ifWorkBool = true;
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Family Time"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               ifWorkBool = false;
                                                           }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [self presentViewController:alert animated:YES completion:nil];
}







-(void)toggleButtonStatusChange:(BOOL)toggleStatus{
    [_endTimeLabel setHidden:toggleStatus];
    [_endTimeTextfield setHidden:toggleStatus];
    [_workOrFamilyLabel setHidden:toggleStatus];
    [_workOrFamilyTextfield setHidden:toggleStatus];
    [_durationLabel setHidden:toggleStatus];
    [_durationTextfield setHidden:toggleStatus];

}

- (IBAction)workOrFamilySegmentedControl:(id)sender {
}

- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"toLogs"]) {
        TableViewController *vc = [segue destinationViewController];
        vc.passedVisit = currentVisit;
        NSLog(@"_________vcvcvcv_____________%@", currentVisit.durationString);
        
    }
}








@end

