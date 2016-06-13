//
//  visitArraySingleton.m
//  TimeTracker
//
//  Created by ling toby on 6/10/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "VisitListSingleton.h"

@implementation VisitListSingleton


+(VisitListSingleton *)getVisitSingleton{
    static VisitListSingleton *visitList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        visitList = [[VisitListSingleton alloc]initPrivately];
    });
    return visitList;
}

- (instancetype)initPrivately {
    self = [super init];
    return self;
}



-(void)initVisitList{
    
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
    
    _visitList = [[NSMutableArray alloc] initWithObjects:visit1,visit2,visit3,visit4
                  , nil];

}


- (void)addNewVisitToList:(Visit *)visitToAdd{
    [_visitList addObject:visitToAdd];

}





@end
