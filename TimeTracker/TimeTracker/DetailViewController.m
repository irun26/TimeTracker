//
//  DetailViewController.m
//  TimeTracker
//
//  Created by Jimson Vedua on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "DetailViewController.h"
#import "Visit.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
//    _messageReceived = _visitDetail.durationString;
//    NSLog(@"%@", _visitDetail.durationString);
    
    
    _visitNameTextfield.text = _visitDetail.name;
    
    _startTimeTextfield.text = _visitDetail.startTimeString;
//        NSLog(@"%@", _visitDetail.startTimeString);
    
    _endTimeTextfield.text = _visitDetail.endTimeString;
//        NSLog(@"%@", _visitDetail.endTimeString);
    
    _durationTextfield.text = _visitDetail.durationString;
    
    if (_visitDetail.ifWorkVisit == 1)
            _workOrFamilyTextfield.text = @"Work";
    else
            _workOrFamilyTextfield.text = @"Family";
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/








@end
