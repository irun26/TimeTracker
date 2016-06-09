//
//  Visit.m
//  TimeTracker
//
//  Created by ling toby on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "Visit.h"

@implementation Visit


-(Visit *)initVisitWith :(NSDate *)startTime :(BOOL) visitType{
    self.startTime = startTime;
    self.ifWorkVisit = visitType;
    self.startTimeString = [self NSDate2StringConverter:startTime];
    return self;
}



-(NSTimeInterval)calculationDuration{
    return [self.endTime timeIntervalSinceDate:self.startTime];
}

-(NSString *)NSTimerInterval2StringCoverter:(NSTimeInterval) duration {
    NSInteger ti = duration;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}



-(NSString *)NSDate2StringConverter:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy HH:mm"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    return stringFromDate;
}




@end