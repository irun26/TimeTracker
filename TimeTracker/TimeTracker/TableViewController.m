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

//NSArray *cellNumberArray;
NSArray *visitArr;
NSTimeInterval workDurationSum;
NSTimeInterval familyDurationSum;


- (void)viewDidLoad {
    
    
    
//    cellNumberArray = @[@"1", @"2", @"3", @"4"];
    [self initVisitArray];
    [super viewDidLoad];
    NSLog(@"______________________%@", _passedVisit.durationString);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initVisitArray{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    Visit *visit1 = [[Visit alloc]init];
    visit1.name = @"Visit1";
    NSDate *startTime1 = [outputFormatter dateFromString:@"2016-06-08 07:12:22"];
    NSDate *endTime1 = [outputFormatter dateFromString:@"2016-06-08 09:12:22"];
    visit1.startTime = startTime1;
    visit1.startTimeString = [visit1 NSDate2StringConverter:startTime1];
    visit1.endTime = endTime1;
    visit1.endTimeString = [visit1 NSDate2StringConverter:endTime1];
    visit1.duration = [visit1 calculationDuration];
    visit1.durationString = [visit1 NSTimerInterval2StringCoverter:visit1.duration];
    visit1.ifWorkVisit = 0;
    
    
    Visit *visit2 = [[Visit alloc]init];
    visit2.name = @"Visit2";
    NSDate *startTime2 = [outputFormatter dateFromString:@"2016-06-08 09:22:22"];
    NSDate *endTime2 = [outputFormatter dateFromString:@"2016-06-08 12:12:42"];
    visit2.startTime = startTime2;
    visit2.startTimeString = [visit2 NSDate2StringConverter:startTime2];
    visit2.endTime = endTime2;
    visit2.endTimeString = [visit2 NSDate2StringConverter:endTime2];
    visit2.duration = [visit2 calculationDuration];
    visit2.durationString = [visit2 NSTimerInterval2StringCoverter:visit2.duration];
    visit2.ifWorkVisit = 1;
    
    
    Visit *visit3 = [[Visit alloc]init];
    visit3.name = @"Visit3";
    NSDate *startTime3 = [outputFormatter dateFromString:@"2016-06-08 13:12:22"];
    NSDate *endTime3 = [outputFormatter dateFromString:@"2016-06-08 14:12:22"];
    visit3.startTime = startTime3;
    visit3.startTimeString = [visit3 NSDate2StringConverter:startTime3];
    visit3.endTime = endTime3;
    visit3.endTimeString = [visit3 NSDate2StringConverter:endTime3];
    visit3.duration = [visit3 calculationDuration];
    visit3.durationString = [visit3 NSTimerInterval2StringCoverter:visit3.duration];
    visit3.ifWorkVisit = 0;
    
    
    Visit *visit4 = [[Visit alloc]init];
    visit4.name = @"Visit4";
    NSDate *startTime4 = [outputFormatter dateFromString:@"2016-06-08 14:34:22"];
    NSDate *endTime4 = [outputFormatter dateFromString:@"2016-06-08 15:27:22"];
    visit4.startTime = startTime4;
    visit4.startTimeString = [visit4 NSDate2StringConverter:startTime4];
    visit4.endTime = endTime4;
    visit4.endTimeString = [visit4 NSDate2StringConverter:endTime4];
    visit4.duration = [visit4 calculationDuration];
    visit4.durationString = [visit4 NSTimerInterval2StringCoverter:visit4.duration];
    visit4.ifWorkVisit = 1;
    
    
    visitArr = @[visit1,visit2,visit3,visit4,_passedVisit];
    
    _passedVisit.name = @"Visit5";
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return [visitArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *name = [[visitArr objectAtIndex:indexPath.row] name];
    NSString *durationString = [[visitArr objectAtIndex:indexPath.row] durationString];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = durationString;
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation


-(void)calcuationWorkSumAndFamSum{
    for (Visit *visit in visitArr) {
        if (visit.ifWorkVisit) {
            workDurationSum += visit.duration;
        }else{
            familyDurationSum += visit.duration;
        }
    }

}


 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
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
         
         // Get the new view controller using [segue destinationViewController].
         // Pass the selected object to the new view controller.
         
         DetailViewController *vc = [segue destinationViewController];
         
         NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
         
         //     NSString *selectedObject = [[visitArr objectAtIndex:selectedIndexPath.row] durationString];
         //     NSLog(@"%@", selectedObject);
         
         //     vc.messageReceived = [[visitArr objectAtIndex:selectedIndexPath.row] durationString];
         
         vc.visitDetail = [visitArr objectAtIndex:selectedIndexPath.row];
     
     }
}

@end
