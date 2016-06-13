//
//  visitArraySingleton.h
//  TimeTracker
//
//  Created by ling toby on 6/10/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Visit.h"

@interface VisitListSingleton : NSObject
@property (strong, nonatomic) NSMutableArray *visitList;


+(VisitListSingleton *)getVisitSingleton;

- (void)initVisitList;
- (void)addNewVisitToList:(Visit *)visitToAdd;




@end
