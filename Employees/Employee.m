//
//  Employee.m
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Employee.h"


@implementation Employee

@synthesize fullName;
@synthesize jobTitle;
@synthesize dob;
@synthesize yearsEmployed;
@synthesize imagePath;

- (void)dealloc
{    
    [fullName release], fullName = nil;
    [jobTitle release], jobTitle = nil;
    [dob release], dob = nil;
    [yearsEmployed release], yearsEmployed = nil;
    [imagePath release], imagePath = nil;
    
    [super dealloc];
}

-(void)populateEmployeeFrom:(NSDictionary *)aDictionary {
    
    self.fullName = [aDictionary objectForKey:@"fullName"];
    self.jobTitle = [aDictionary objectForKey:@"jobTitle"];
    self.dob = [aDictionary objectForKey:@"dob"];
    self.yearsEmployed = [aDictionary objectForKey:@"yearsEmployed"];
    self.imagePath = [aDictionary objectForKey:@"imagePath"];
}


@end
