//
//  EmployeeDetailView.m
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "EmployeeDetailView.h"

@interface EmployeeDetailView (PrivateMethods)

+(NSString *)textForYears:(NSNumber *)yearsEmployed; 
+(NSString *)textForYearBorn:(NSDate *)dateOfBirth;
+(NSString *)textForDateBorn:(NSDate *)dateOfBirth;

@end

@implementation EmployeeDetailView

@synthesize closeButton;
@synthesize imageView;
@synthesize fullName;
@synthesize jobTitle;
@synthesize yearsNum;
@synthesize yearsText;
@synthesize yearBorn;
@synthesize dateBorn;

- (void)dealloc
{
    [closeButton release], closeButton = nil;
    [imageView release], imageView = nil;
    [fullName release], fullName = nil;
    [jobTitle release], jobTitle = nil;
    [yearsNum release], yearsNum = nil;
    [yearsText release], yearsText = nil;
    [yearBorn release], yearBorn = nil;
    [dateBorn release], dateBorn = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setEmployeeFields:(Employee *)theEmployee {
    
    self.fullName.text = theEmployee.fullName;
    self.jobTitle.text = theEmployee.jobTitle;
    [self.imageView setImage:[UIImage imageNamed:theEmployee.imagePath]];
    self.yearsNum.text = [NSString stringWithFormat:@"%d", [theEmployee.yearsEmployed intValue]];
    self.yearsText.text = [EmployeeDetailView textForYears:theEmployee.yearsEmployed];
    self.yearBorn.text = [EmployeeDetailView textForYearBorn:theEmployee.dob];
    self.dateBorn.text = [EmployeeDetailView textForDateBorn:theEmployee.dob];
}

+(NSString *)textForYearBorn:(NSDate *)dateOfBirth {
    
    NSDateFormatter *yearFormat = [[NSDateFormatter alloc] init];
    [yearFormat setDateFormat:@"yyyy"];
    
    NSString *theDate = [yearFormat stringFromDate:dateOfBirth];

    return theDate;
}

+(NSString *)textForDateBorn:(NSDate *)dateOfBirth {
    
    NSDateFormatter *yearFormat = [[NSDateFormatter alloc] init];
    [yearFormat setDateFormat:@"MMM d"];
    
    NSString *theDate = [yearFormat stringFromDate:dateOfBirth];
    
    return theDate;    
}

+(NSString *)textForYears:(NSNumber *)yearsEmployed {
    
    NSString *theText = nil;
    
    if ([yearsEmployed intValue] == 1) {
        
        theText = @"year";
    }
    else {
        
        theText = @"years";
    }
    
    return theText;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 2.0f;
}



@end
