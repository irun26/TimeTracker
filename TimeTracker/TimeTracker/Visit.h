//
//  Visit.h
//  TimeTracker
//
//  Created by ling toby on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Visit : NSObject

@property NSString *name;
@property float longitude;
@property float latitude;
@property NSDate *startTime;
@property NSString *startTimeString;
@property NSDate *endTime;
@property NSString *endTimeString;
@property NSTimeInterval duration;
@property NSString *durationString;
@property BOOL ifWorkVisit;


-(NSTimeInterval)calculationDuration;
-(NSString *)NSTimerInterval2StringCoverter:(NSTimeInterval) duration;
-(NSString *)NSDate2StringConverter:(NSDate *)date;
-(Visit *)initVisitWith :(NSDate *)startTime :(NSDate *)endTime :(NSTimeInterval)duration :(BOOL)visitType;

@end