//
//  TableViewController.m
//  TimeTracker
//
//  Created by Jimson Vedua on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "SummaryViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

NSTimeInterval workDurationSum;
NSTimeInterval familyDurationSum;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"______________________%@", _passedVisit.durationString);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[VisitListSingleton getVisitSingleton].visitList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *name = [[[VisitListSingleton getVisitSingleton].visitList objectAtIndex:indexPath.row] name];
    NSString *durationString = [[[VisitListSingleton getVisitSingleton].visitList objectAtIndex:indexPath.row] durationString];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = durationString;
    return cell;
}


 #pragma mark - Navigation
-(void)calcuationWorkSumAndFamSum{
    for (Visit *visit in [VisitListSingleton getVisitSingleton].visitList) {
        if (visit.ifWorkVisit) {
            workDurationSum += visit.duration;
        }else{
            familyDurationSum += visit.duration;
        }
    }
}

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     NSString *summaryToSend1;
     NSString *summaryToSend2;
     NSString *summaryToSend;
     if([[segue identifier] isEqualToString:@"toSummary"]){
         [self calcuationWorkSumAndFamSum];
         NSInteger ti = workDurationSum;
         NSInteger seconds = ti % 60;
         NSInteger minutes = (ti / 60) % 60;
         NSInteger hours = (ti / 3600);
         summaryToSend1 = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
         
         NSInteger ta = familyDurationSum;
         NSInteger seconds2 = ta % 60;
         NSInteger minutes2 = (ta / 60) % 60;
         NSInteger hours2 = (ta / 3600);
         summaryToSend2 = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours2, (long)minutes2, (long)seconds2];
         
         summaryToSend = [NSString stringWithFormat:@"The time you spend with family is %@, the time you spend at work is %@ ", summaryToSend2, summaryToSend1];
         
         SummaryViewController *vc = [segue destinationViewController];
         vc.summary = summaryToSend;
         
         
}
     if([[segue identifier] isEqualToString:@"toDetail"]){
         
         DetailViewController *vc = [segue destinationViewController];
         NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
         vc.visitDetail = [[VisitListSingleton getVisitSingleton].visitList objectAtIndex:selectedIndexPath.row];
     }
}

@end
