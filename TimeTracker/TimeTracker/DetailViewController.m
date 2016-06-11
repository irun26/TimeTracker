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
    _visitNameTextfield.text = _visitDetail.name;
    _startTimeTextfield.text = _visitDetail.startTimeString;
    _endTimeTextfield.text = _visitDetail.endTimeString;
    _durationTextfield.text = _visitDetail.durationString;
    
    if (_visitDetail.ifWorkVisit == 1)
            _workOrFamilyTextfield.text = @"Work";
    else
            _workOrFamilyTextfield.text = @"Family";
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
