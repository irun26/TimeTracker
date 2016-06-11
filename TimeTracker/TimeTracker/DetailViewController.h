//
//  DetailViewController.h
//  TimeTracker
//
//  Created by Jimson Vedua on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Visit.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Visit *visitDetail;

@property (weak, nonatomic) IBOutlet UILabel *visitDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *visitNameTextfield;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UITextField *durationTextfield;

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UITextField *startTimeTextfield;

@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UITextField *endTimeTextfield;

@property (weak, nonatomic) IBOutlet UILabel *workOrFamilyLabel;
@property (weak, nonatomic) IBOutlet UITextField *workOrFamilyTextfield;


@end
