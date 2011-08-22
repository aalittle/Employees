//
//  EmployeeDetailView.h
//  Employees
//
//  Created by Andrew Little on 11-08-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface EmployeeDetailView : UIView {
    
    UIButton *closeButton;    
    UIImageView *imageView;
    UILabel *fullName;
    UILabel *jobTitle;
    UILabel *yearsNum;
    UILabel *yearsText;
    UILabel *yearBorn;
    UILabel *dateBorn;
}

@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *fullName;
@property (nonatomic, retain) IBOutlet UILabel *jobTitle;
@property (nonatomic, retain) IBOutlet UILabel *yearsNum;
@property (nonatomic, retain) IBOutlet UILabel *yearsText;
@property (nonatomic, retain) IBOutlet UILabel *yearBorn;
@property (nonatomic, retain) IBOutlet UILabel *dateBorn;

-(void)setEmployeeFields:(Employee *)theEmployee;

@end
