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


BOOL ifWorkBool,labelsShowOrNot;;
Visit *currentVisit;
int buttonPressCount;


- (void)viewDidLoad {
    
//# 1.2 initiate the loading page
    [super viewDidLoad];
    [self labelsHideOrNot:YES];
    buttonPressCount = 0;
    currentVisit = [[Visit alloc]initVisitWith:nil :nil :0.00 :nil];
    [self initLabelContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//1.1 hook up the labels with model.
-(void)initLabelContent{
    _startTimeTextfield.text = currentVisit.startTimeString;
    _endTimeTextfield.text =currentVisit.endTimeString;
    _durationTextfield.text = currentVisit.durationString;
    _workOrFamilyTextfield.text = currentVisit.ifWorkVisit ? @"work visit": @"family time";
}


//# 2 time capture, generate startTimeString.
- (IBAction)checkInButton:(id)sender {
    //#6 end time capture
    if (buttonPressCount == 1) {
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
        NSDate * now = [NSDate date];
        
        currentVisit.endTime = now;
        currentVisit.endTimeString = [currentVisit NSDate2StringConverter:now];
        
        //#7 calculate duration
        currentVisit.duration = [currentVisit calculationDuration];
        currentVisit.durationString = [currentVisit NSTimerInterval2StringCoverter:currentVisit.duration];
        [self initLabelContent];
         buttonPressCount ++;
    }
    
    // 2.1 user press checkin buttom for the first time.
    else if (buttonPressCount == 0){
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
        currentVisit.startTime = [NSDate date];
        currentVisit.startTimeString = [currentVisit NSDate2StringConverter:currentVisit.startTime];

    //3 show start time at label
        //instead of assigning starttime to label individually. we call initLabelContent again to refresh the label.
        [self initLabelContent];
        
        
    //# 2.2 button change to check out
        [self labelsHideOrNot:NO];
        [self ifWorkAlert];
        
        
        //by using button press, we move to the next stage.
        buttonPressCount ++;
    }
    
    
if(buttonPressCount >=2){
        _checkInOutButton.enabled = YES;
        _checkInOutButton.alpha = 0.5;
    }
}


//#4  popout "work" or "family"?
- (void) ifWorkAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"What is the purpose of your visit?"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Work Visit"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              currentVisit.ifWorkVisit = true;
                                                              [self initLabelContent];
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Family Time"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               currentVisit.ifWorkVisit = false;
                                                               [self initLabelContent];
                                                           }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)labelsHideOrNot:(BOOL)toggleStatus{
    [_endTimeLabel setHidden:toggleStatus];
    [_endTimeTextfield setHidden:toggleStatus];
    [_workOrFamilyLabel setHidden:toggleStatus];
    [_workOrFamilyTextfield setHidden:toggleStatus];
    [_durationLabel setHidden:toggleStatus];
    [_durationTextfield setHidden:toggleStatus];

}

- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"toLogs"]) {
        TableViewController *vc = [segue destinationViewController];
        vc.passedVisit = currentVisit;
    }
}



@end

