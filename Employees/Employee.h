//
//  Employee.h
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject {
 
    NSString *fullName;
    NSString *jobTitle;
    NSDate   *dob;
    NSNumber *yearsEmployed;
    NSString *imagePath;
}

@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *jobTitle;
@property (nonatomic, retain) NSDate   *dob; 
@property (nonatomic, retain) NSNumber *yearsEmployed;
@property (nonatomic, retain) NSString *imagePath;

-(void)populateEmployeeFrom:(NSDictionary *)aDictionary;

@end
